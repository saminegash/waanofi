import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../domain/buyer_account_model.dart';

final buyerRepositoryProvider = Provider<BuyerRepository>((ref) {
  return BuyerRepository(client: Supabase.instance.client);
});

final currentBuyerAccountProvider = FutureProvider<BuyerAccountModel?>((ref) async {
  final repo = ref.watch(buyerRepositoryProvider);
  return repo.getCurrentBuyerAccount();
});

class BuyerRepository {
  BuyerRepository({required SupabaseClient client}) : _client = client;
  final SupabaseClient _client;

  Future<BuyerAccountModel?> getCurrentBuyerAccount() async {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    try {
      final response = await _client
          .from('buyer_accounts')
          .select()
          .eq('user_id', user.id)
          .maybeSingle();
      
      if (response == null) return null;
      return BuyerAccountModel.fromJson(response);
    } catch (e) {
      // Return null if table not ready or network fail
      return null;
    }
  }

  Future<BuyerAccountModel> saveBuyerAccount({
    required BuyerType buyerType,
    String? organizationName,
    required String contactName,
    required String phone,
    required String email,
    String? taxNumber,
    String preferredLanguage = 'en',
  }) async {
    final user = _client.auth.currentUser!;
    final now = DateTime.now();

    final model = BuyerAccountModel(
      userId: user.id,
      buyerType: buyerType,
      organizationName: organizationName,
      contactName: contactName,
      phone: phone,
      email: email,
      taxNumber: taxNumber,
      verificationStatus: 'unverified',
      preferredLanguage: preferredLanguage,
      createdAt: now,
      updatedAt: now,
    );

    final response = await _client.from('buyer_accounts').upsert(
      model.toJson(),
      onConflict: 'user_id',
    ).select().single();

    return BuyerAccountModel.fromJson(response);
  }
}
