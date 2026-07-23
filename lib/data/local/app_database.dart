import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:flutter/foundation.dart';

import 'daos/animals_dao.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [AnimalsTable],
  daos: [AnimalsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Web support is more complex, fallback to a simple in-memory DB if on web.
    // In a real app, drift_local_storage or drift_web would be used for persistence.
    if (kIsWeb) {
      return NativeDatabase.memory();
    }

    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'waanofi_dairy.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
