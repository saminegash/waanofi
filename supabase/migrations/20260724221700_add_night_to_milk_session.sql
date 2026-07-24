-- Add 'night' to milk_session enum
-- This cannot run in a transaction block, but Supabase CLI handles it.
ALTER TYPE milk_session ADD VALUE IF NOT EXISTS 'night';
