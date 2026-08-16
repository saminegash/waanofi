import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../domain/delivery_address_model.dart';

final addressRepositoryProvider = Provider<AddressRepository>((ref) {
  return AddressRepository(client: Supabase.instance.client);
});

final buyerAddressesProvider = StreamProvider<List<DeliveryAddressModel>>((ref) {
  final repo = ref.watch(addressRepositoryProvider);
  return repo.watchAddresses();
});

class AddressRepository {
  AddressRepository({required SupabaseClient client}) : _client = client;
  final SupabaseClient _client;

  Stream<List<DeliveryAddressModel>> watchAddresses() {
    final user = _client.auth.currentUser;
    if (user == null) return Stream.value([]);

    return _client
        .from('delivery_addresses')
        .stream(primaryKey: ['id'])
        .eq('buyer_id', user.id)
        .map((data) => data.map((json) => DeliveryAddressModel.fromJson(json)).toList());
  }

  Future<List<DeliveryAddressModel>> getAddresses() async {
    final user = _client.auth.currentUser;
    if (user == null) return [];

    final response = await _client
        .from('delivery_addresses')
        .select()
        .eq('buyer_id', user.id)
        .order('is_default', ascending: false)
        .order('created_at', ascending: false);

    return (response as List).map((json) => DeliveryAddressModel.fromJson(json)).toList();
  }

  Future<DeliveryAddressModel> saveAddress({
    String? id,
    required String label,
    required String recipientName,
    required String phone,
    required String region,
    required String city,
    required String subCity,
    required String neighborhood,
    required String landmark,
    double? latitude,
    double? longitude,
    String? deliveryInstructions,
    bool isDefault = false,
  }) async {
    final user = _client.auth.currentUser!;
    final now = DateTime.now();

    final data = {
      if (id != null) 'id': id,
      'buyer_id': user.id,
      'label': label,
      'recipient_name': recipientName,
      'phone': phone,
      'region': region,
      'city': city,
      'sub_city': subCity,
      'neighborhood': neighborhood,
      'landmark': landmark,
      'latitude': latitude,
      'longitude': longitude,
      'delivery_instructions': deliveryInstructions,
      'is_default': isDefault,
      'updated_at': now.toIso8601String(),
      if (id == null) 'created_at': now.toIso8601String(),
    };

    final response = await _client.from('delivery_addresses').upsert(data).select().single();
    return DeliveryAddressModel.fromJson(response);
  }

  Future<void> setDefaultAddress(String addressId) async {
    final user = _client.auth.currentUser!;
    await _client.from('delivery_addresses').update({'is_default': true}).eq('id', addressId).eq('buyer_id', user.id);
  }

  Future<void> deleteAddress(String addressId) async {
    final user = _client.auth.currentUser!;
    await _client.from('delivery_addresses').delete().eq('id', addressId).eq('buyer_id', user.id);
  }
}
