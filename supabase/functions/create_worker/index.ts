import { serve } from "https://deno.land/std@0.177.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.39.3";

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const supabaseUrl = Deno.env.get('SUPABASE_URL') ?? '';
    const supabaseServiceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '';

    if (!supabaseUrl || !supabaseServiceKey) {
      throw new Error("Server configuration error: missing Supabase credentials");
    }

    const supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey, {
      auth: {
        autoRefreshToken: false,
        persistSession: false
      }
    });

    // 1. Authenticate the caller to ensure they are an admin
    const authHeader = req.headers.get('Authorization')!;
    if (!authHeader) {
      throw new Error("Missing Authorization header");
    }

    const token = authHeader.replace('Bearer ', '');
    const { data: { user: adminUser }, error: adminAuthError } = await supabaseAdmin.auth.getUser(token);

    if (adminAuthError || !adminUser) {
      throw new Error("Unauthorized: Invalid token");
    }

    // 2. Fetch the caller's profile to verify they are an admin and get their farm_id
    const { data: adminProfile, error: profileError } = await supabaseAdmin
      .from('profiles')
      .select('role, farm_id')
      .eq('id', adminUser.id)
      .single();

    if (profileError || !adminProfile) {
      throw new Error("Could not fetch admin profile");
    }

    if (adminProfile.role !== 'admin' || !adminProfile.farm_id) {
      throw new Error("Forbidden: You must be an admin with an active farm to create workers.");
    }

    // 3. Parse the request body for the new worker's details
    const { email, password, full_name } = await req.json();
    if (!email || !password || !full_name) {
      throw new Error("Missing required fields: email, password, full_name");
    }

    // 4. Create the user using the Admin Auth API (bypassing email confirmation by setting email_confirm to true)
    const { data: authData, error: createError } = await supabaseAdmin.auth.admin.createUser({
      email,
      password,
      email_confirm: true,
      user_metadata: {
        full_name: full_name,
      }
    });

    if (createError || !authData.user) {
      throw new Error(createError?.message || "Failed to create user");
    }

    // 5. Create their profile in the public schema
    const { error: insertProfileError } = await supabaseAdmin
      .from('profiles')
      .update({
        full_name: full_name,
        role: 'user',
        farm_id: adminProfile.farm_id
      })
      .eq('id', authData.user.id);
      
    // Note: The handle_new_user trigger inserts the default profile. We update it.

    if (insertProfileError) {
      throw new Error(insertProfileError.message || "Failed to link user to farm");
    }

    return new Response(
      JSON.stringify({ 
        message: 'Worker created successfully', 
        user_id: authData.user.id 
      }),
      { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 200 },
    );

  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 },
    );
  }
});
