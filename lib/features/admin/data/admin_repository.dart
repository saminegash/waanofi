import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../domain/audit_log_model.dart';
import '../domain/profile_model.dart';

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  final user = ref.watch(currentUserProvider);
  return AdminRepository(
    client: Supabase.instance.client,
    farmId: user?.farmId,
  );
});

class AdminRepository {
  AdminRepository({
    required SupabaseClient client,
    required String? farmId,
  })  : _client = client,
        _farmId = farmId;

  final SupabaseClient _client;
  final String? _farmId;

  Future<List<ProfileModel>> getWorkers() async {
    if (_farmId == null) return [];
    final response = await _client
        .from('profiles')
        .select()
        .eq('farm_id', _farmId!)
        .order('created_at');
        
    return (response as List).map((json) => ProfileModel.fromJson(json)).toList();
  }

  Future<void> updateWorkerRole(String userId, String role) async {
    await _client
        .from('profiles')
        .update({'role': role})
        .eq('id', userId);
  }

  Future<void> updateWorkerStatus(String userId, bool active) async {
    await _client
        .from('profiles')
        .update({'active': active})
        .eq('id', userId);
  }

  Future<List<AuditLogModel>> getAuditLogs({int limit = 100}) async {
    if (_farmId == null) return [];
    
    // Join with profiles to get the full name of who changed it
    final response = await _client
        .from('audit_logs')
        .select('''
          *,
          profiles(full_name)
        ''')
        .eq('farm_id', _farmId!)
        .order('changed_at', ascending: false)
        .limit(limit);

    return (response as List).map((json) {
      final profile = json['profiles'];
      final fullName = profile != null ? profile['full_name'] : 'System';
      
      return AuditLogModel.fromJson(json).copyWith(changedByFullName: fullName);
    }).toList();
  }

  Future<double> getMilkPrice() async {
    if (_farmId == null) return 0.0;
    final response = await _client
        .from('farms')
        .select('milk_price_per_litre')
        .eq('id', _farmId!)
        .single();
    return (response['milk_price_per_litre'] as num).toDouble();
  }

  Future<void> updateMilkPrice(double newPrice) async {
    if (_farmId == null) return;
    await _client
        .from('farms')
        .update({'milk_price_per_litre': newPrice})
        .eq('id', _farmId!);
  }

  Future<String> getFarmType() async {
    if (_farmId == null) return 'dairy';
    final response = await _client
        .from('farms')
        .select('farm_type')
        .eq('id', _farmId!)
        .single();
    return (response['farm_type'] as String?) ?? 'dairy';
  }

  Future<void> updateFarmType(String newType) async {
    if (_farmId == null) return;
    await _client
        .from('farms')
        .update({'farm_type': newType})
        .eq('id', _farmId!);
  }
}

