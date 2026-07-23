// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AnimalsTableTable extends AnimalsTable
    with TableInfo<$AnimalsTableTable, LocalAnimal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnimalsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _farmIdMeta = const VerificationMeta('farmId');
  @override
  late final GeneratedColumn<String> farmId = GeneratedColumn<String>(
    'farm_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagNumberMeta = const VerificationMeta(
    'tagNumber',
  );
  @override
  late final GeneratedColumn<String> tagNumber = GeneratedColumn<String>(
    'tag_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
    'breed',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<DateTime> dob = GeneratedColumn<DateTime>(
    'dob',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoUrlMeta = const VerificationMeta(
    'photoUrl',
  );
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
    'photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    farmId,
    tagNumber,
    name,
    breed,
    sex,
    dob,
    status,
    photoUrl,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'animals_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalAnimal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('farm_id')) {
      context.handle(
        _farmIdMeta,
        farmId.isAcceptableOrUnknown(data['farm_id']!, _farmIdMeta),
      );
    } else if (isInserting) {
      context.missing(_farmIdMeta);
    }
    if (data.containsKey('tag_number')) {
      context.handle(
        _tagNumberMeta,
        tagNumber.isAcceptableOrUnknown(data['tag_number']!, _tagNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_tagNumberMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('breed')) {
      context.handle(
        _breedMeta,
        breed.isAcceptableOrUnknown(data['breed']!, _breedMeta),
      );
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('dob')) {
      context.handle(
        _dobMeta,
        dob.isAcceptableOrUnknown(data['dob']!, _dobMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('photo_url')) {
      context.handle(
        _photoUrlMeta,
        photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalAnimal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalAnimal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      tagNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_number'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      breed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed'],
      ),
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      )!,
      dob: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}dob'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      photoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_url'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AnimalsTableTable createAlias(String alias) {
    return $AnimalsTableTable(attachedDatabase, alias);
  }
}

class LocalAnimal extends DataClass implements Insertable<LocalAnimal> {
  final String id;
  final String farmId;
  final String tagNumber;
  final String? name;
  final String? breed;
  final String sex;
  final DateTime? dob;
  final String status;
  final String? photoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  const LocalAnimal({
    required this.id,
    required this.farmId,
    required this.tagNumber,
    this.name,
    this.breed,
    required this.sex,
    this.dob,
    required this.status,
    this.photoUrl,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['farm_id'] = Variable<String>(farmId);
    map['tag_number'] = Variable<String>(tagNumber);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || breed != null) {
      map['breed'] = Variable<String>(breed);
    }
    map['sex'] = Variable<String>(sex);
    if (!nullToAbsent || dob != null) {
      map['dob'] = Variable<DateTime>(dob);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AnimalsTableCompanion toCompanion(bool nullToAbsent) {
    return AnimalsTableCompanion(
      id: Value(id),
      farmId: Value(farmId),
      tagNumber: Value(tagNumber),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      breed: breed == null && nullToAbsent
          ? const Value.absent()
          : Value(breed),
      sex: Value(sex),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      status: Value(status),
      photoUrl: photoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUrl),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalAnimal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalAnimal(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      tagNumber: serializer.fromJson<String>(json['tagNumber']),
      name: serializer.fromJson<String?>(json['name']),
      breed: serializer.fromJson<String?>(json['breed']),
      sex: serializer.fromJson<String>(json['sex']),
      dob: serializer.fromJson<DateTime?>(json['dob']),
      status: serializer.fromJson<String>(json['status']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'farmId': serializer.toJson<String>(farmId),
      'tagNumber': serializer.toJson<String>(tagNumber),
      'name': serializer.toJson<String?>(name),
      'breed': serializer.toJson<String?>(breed),
      'sex': serializer.toJson<String>(sex),
      'dob': serializer.toJson<DateTime?>(dob),
      'status': serializer.toJson<String>(status),
      'photoUrl': serializer.toJson<String?>(photoUrl),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalAnimal copyWith({
    String? id,
    String? farmId,
    String? tagNumber,
    Value<String?> name = const Value.absent(),
    Value<String?> breed = const Value.absent(),
    String? sex,
    Value<DateTime?> dob = const Value.absent(),
    String? status,
    Value<String?> photoUrl = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => LocalAnimal(
    id: id ?? this.id,
    farmId: farmId ?? this.farmId,
    tagNumber: tagNumber ?? this.tagNumber,
    name: name.present ? name.value : this.name,
    breed: breed.present ? breed.value : this.breed,
    sex: sex ?? this.sex,
    dob: dob.present ? dob.value : this.dob,
    status: status ?? this.status,
    photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LocalAnimal copyWithCompanion(AnimalsTableCompanion data) {
    return LocalAnimal(
      id: data.id.present ? data.id.value : this.id,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      tagNumber: data.tagNumber.present ? data.tagNumber.value : this.tagNumber,
      name: data.name.present ? data.name.value : this.name,
      breed: data.breed.present ? data.breed.value : this.breed,
      sex: data.sex.present ? data.sex.value : this.sex,
      dob: data.dob.present ? data.dob.value : this.dob,
      status: data.status.present ? data.status.value : this.status,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalAnimal(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('tagNumber: $tagNumber, ')
          ..write('name: $name, ')
          ..write('breed: $breed, ')
          ..write('sex: $sex, ')
          ..write('dob: $dob, ')
          ..write('status: $status, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    farmId,
    tagNumber,
    name,
    breed,
    sex,
    dob,
    status,
    photoUrl,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalAnimal &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.tagNumber == this.tagNumber &&
          other.name == this.name &&
          other.breed == this.breed &&
          other.sex == this.sex &&
          other.dob == this.dob &&
          other.status == this.status &&
          other.photoUrl == this.photoUrl &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AnimalsTableCompanion extends UpdateCompanion<LocalAnimal> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String> tagNumber;
  final Value<String?> name;
  final Value<String?> breed;
  final Value<String> sex;
  final Value<DateTime?> dob;
  final Value<String> status;
  final Value<String?> photoUrl;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AnimalsTableCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.tagNumber = const Value.absent(),
    this.name = const Value.absent(),
    this.breed = const Value.absent(),
    this.sex = const Value.absent(),
    this.dob = const Value.absent(),
    this.status = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnimalsTableCompanion.insert({
    required String id,
    required String farmId,
    required String tagNumber,
    this.name = const Value.absent(),
    this.breed = const Value.absent(),
    required String sex,
    this.dob = const Value.absent(),
    required String status,
    this.photoUrl = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       farmId = Value(farmId),
       tagNumber = Value(tagNumber),
       sex = Value(sex),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<LocalAnimal> custom({
    Expression<String>? id,
    Expression<String>? farmId,
    Expression<String>? tagNumber,
    Expression<String>? name,
    Expression<String>? breed,
    Expression<String>? sex,
    Expression<DateTime>? dob,
    Expression<String>? status,
    Expression<String>? photoUrl,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (tagNumber != null) 'tag_number': tagNumber,
      if (name != null) 'name': name,
      if (breed != null) 'breed': breed,
      if (sex != null) 'sex': sex,
      if (dob != null) 'dob': dob,
      if (status != null) 'status': status,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnimalsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? farmId,
    Value<String>? tagNumber,
    Value<String?>? name,
    Value<String?>? breed,
    Value<String>? sex,
    Value<DateTime?>? dob,
    Value<String>? status,
    Value<String?>? photoUrl,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AnimalsTableCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      tagNumber: tagNumber ?? this.tagNumber,
      name: name ?? this.name,
      breed: breed ?? this.breed,
      sex: sex ?? this.sex,
      dob: dob ?? this.dob,
      status: status ?? this.status,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (farmId.present) {
      map['farm_id'] = Variable<String>(farmId.value);
    }
    if (tagNumber.present) {
      map['tag_number'] = Variable<String>(tagNumber.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (dob.present) {
      map['dob'] = Variable<DateTime>(dob.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnimalsTableCompanion(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('tagNumber: $tagNumber, ')
          ..write('name: $name, ')
          ..write('breed: $breed, ')
          ..write('sex: $sex, ')
          ..write('dob: $dob, ')
          ..write('status: $status, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AnimalsTableTable animalsTable = $AnimalsTableTable(this);
  late final AnimalsDao animalsDao = AnimalsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [animalsTable];
}

typedef $$AnimalsTableTableCreateCompanionBuilder =
    AnimalsTableCompanion Function({
      required String id,
      required String farmId,
      required String tagNumber,
      Value<String?> name,
      Value<String?> breed,
      required String sex,
      Value<DateTime?> dob,
      required String status,
      Value<String?> photoUrl,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AnimalsTableTableUpdateCompanionBuilder =
    AnimalsTableCompanion Function({
      Value<String> id,
      Value<String> farmId,
      Value<String> tagNumber,
      Value<String?> name,
      Value<String?> breed,
      Value<String> sex,
      Value<DateTime?> dob,
      Value<String> status,
      Value<String?> photoUrl,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AnimalsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AnimalsTableTable> {
  $$AnimalsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get farmId => $composableBuilder(
    column: $table.farmId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagNumber => $composableBuilder(
    column: $table.tagNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dob => $composableBuilder(
    column: $table.dob,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AnimalsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AnimalsTableTable> {
  $$AnimalsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get farmId => $composableBuilder(
    column: $table.farmId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagNumber => $composableBuilder(
    column: $table.tagNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dob => $composableBuilder(
    column: $table.dob,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AnimalsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnimalsTableTable> {
  $$AnimalsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get farmId =>
      $composableBuilder(column: $table.farmId, builder: (column) => column);

  GeneratedColumn<String> get tagNumber =>
      $composableBuilder(column: $table.tagNumber, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<DateTime> get dob =>
      $composableBuilder(column: $table.dob, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AnimalsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnimalsTableTable,
          LocalAnimal,
          $$AnimalsTableTableFilterComposer,
          $$AnimalsTableTableOrderingComposer,
          $$AnimalsTableTableAnnotationComposer,
          $$AnimalsTableTableCreateCompanionBuilder,
          $$AnimalsTableTableUpdateCompanionBuilder,
          (
            LocalAnimal,
            BaseReferences<_$AppDatabase, $AnimalsTableTable, LocalAnimal>,
          ),
          LocalAnimal,
          PrefetchHooks Function()
        > {
  $$AnimalsTableTableTableManager(_$AppDatabase db, $AnimalsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnimalsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnimalsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnimalsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> farmId = const Value.absent(),
                Value<String> tagNumber = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> breed = const Value.absent(),
                Value<String> sex = const Value.absent(),
                Value<DateTime?> dob = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimalsTableCompanion(
                id: id,
                farmId: farmId,
                tagNumber: tagNumber,
                name: name,
                breed: breed,
                sex: sex,
                dob: dob,
                status: status,
                photoUrl: photoUrl,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String farmId,
                required String tagNumber,
                Value<String?> name = const Value.absent(),
                Value<String?> breed = const Value.absent(),
                required String sex,
                Value<DateTime?> dob = const Value.absent(),
                required String status,
                Value<String?> photoUrl = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AnimalsTableCompanion.insert(
                id: id,
                farmId: farmId,
                tagNumber: tagNumber,
                name: name,
                breed: breed,
                sex: sex,
                dob: dob,
                status: status,
                photoUrl: photoUrl,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AnimalsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnimalsTableTable,
      LocalAnimal,
      $$AnimalsTableTableFilterComposer,
      $$AnimalsTableTableOrderingComposer,
      $$AnimalsTableTableAnnotationComposer,
      $$AnimalsTableTableCreateCompanionBuilder,
      $$AnimalsTableTableUpdateCompanionBuilder,
      (
        LocalAnimal,
        BaseReferences<_$AppDatabase, $AnimalsTableTable, LocalAnimal>,
      ),
      LocalAnimal,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AnimalsTableTableTableManager get animalsTable =>
      $$AnimalsTableTableTableManager(_db, _db.animalsTable);
}
