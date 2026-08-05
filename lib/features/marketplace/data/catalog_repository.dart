import 'dart:async';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/providers/database_provider.dart';
import '../../../data/local/app_database.dart';
import '../domain/market_product_model.dart';

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return CatalogRepository(client: Supabase.instance.client, db: db);
});

class CatalogRepository {
  CatalogRepository({required SupabaseClient client, required AppDatabase db})
      : _client = client,
        _db = db {
    _init();
  }

  final SupabaseClient _client;
  final AppDatabase _db;

  Future<void> _init() async {
    await fetchAndCacheCatalog();
  }

  Future<void> fetchAndCacheCatalog() async {
    try {
      final res = await _client.from('market_products').select().eq('active', true).order('display_order');
      final models = (res as List).map((json) => MarketProductModel.fromJson(json)).toList();

      for (final m in models) {
        await _db.into(_db.marketProductsTable).insertOnConflictUpdate(
          MarketProductsTableCompanion.insert(
            id: m.id,
            productCode: m.productCode,
            category: m.category,
            nameEn: m.nameEn,
            nameAm: m.nameAm,
            nameOm: m.nameOm,
            baseInventoryUnit: m.baseInventoryUnit,
            active: drift.Value(m.active),
          ),
        );
      }
    } catch (e) {
      debugPrint('Catalog remote sync failed: $e');
    }
  }

  Stream<List<MarketProductModel>> watchProducts() {
    return _db.select(_db.marketProductsTable).watch().map((rows) => rows.map((r) => MarketProductModel(
      id: r.id,
      productCode: r.productCode,
      category: r.category,
      nameEn: r.nameEn,
      nameAm: r.nameAm,
      nameOm: r.nameOm,
      baseInventoryUnit: r.baseInventoryUnit,
      active: r.active,
    )).toList());
  }
}
