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
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
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
    this.status = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       farmId = Value(farmId),
       tagNumber = Value(tagNumber),
       sex = Value(sex);
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

class $MilkRecordsTableTable extends MilkRecordsTable
    with TableInfo<$MilkRecordsTableTable, LocalMilkRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MilkRecordsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _animalIdMeta = const VerificationMeta(
    'animalId',
  );
  @override
  late final GeneratedColumn<String> animalId = GeneratedColumn<String>(
    'animal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionMeta = const VerificationMeta(
    'session',
  );
  @override
  late final GeneratedColumn<String> session = GeneratedColumn<String>(
    'session',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _litresMeta = const VerificationMeta('litres');
  @override
  late final GeneratedColumn<double> litres = GeneratedColumn<double>(
    'litres',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByMeta = const VerificationMeta(
    'recordedBy',
  );
  @override
  late final GeneratedColumn<String> recordedBy = GeneratedColumn<String>(
    'recorded_by',
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    farmId,
    animalId,
    recordedAt,
    session,
    litres,
    recordedBy,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'milk_records_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalMilkRecord> instance, {
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
    if (data.containsKey('animal_id')) {
      context.handle(
        _animalIdMeta,
        animalId.isAcceptableOrUnknown(data['animal_id']!, _animalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_animalIdMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('session')) {
      context.handle(
        _sessionMeta,
        session.isAcceptableOrUnknown(data['session']!, _sessionMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionMeta);
    }
    if (data.containsKey('litres')) {
      context.handle(
        _litresMeta,
        litres.isAcceptableOrUnknown(data['litres']!, _litresMeta),
      );
    } else if (isInserting) {
      context.missing(_litresMeta);
    }
    if (data.containsKey('recorded_by')) {
      context.handle(
        _recordedByMeta,
        recordedBy.isAcceptableOrUnknown(data['recorded_by']!, _recordedByMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalMilkRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalMilkRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      animalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}animal_id'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      session: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session'],
      )!,
      litres: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}litres'],
      )!,
      recordedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MilkRecordsTableTable createAlias(String alias) {
    return $MilkRecordsTableTable(attachedDatabase, alias);
  }
}

class LocalMilkRecord extends DataClass implements Insertable<LocalMilkRecord> {
  final String id;
  final String farmId;
  final String animalId;
  final DateTime recordedAt;
  final String session;
  final double litres;
  final String? recordedBy;
  final DateTime createdAt;
  const LocalMilkRecord({
    required this.id,
    required this.farmId,
    required this.animalId,
    required this.recordedAt,
    required this.session,
    required this.litres,
    this.recordedBy,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['farm_id'] = Variable<String>(farmId);
    map['animal_id'] = Variable<String>(animalId);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    map['session'] = Variable<String>(session);
    map['litres'] = Variable<double>(litres);
    if (!nullToAbsent || recordedBy != null) {
      map['recorded_by'] = Variable<String>(recordedBy);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MilkRecordsTableCompanion toCompanion(bool nullToAbsent) {
    return MilkRecordsTableCompanion(
      id: Value(id),
      farmId: Value(farmId),
      animalId: Value(animalId),
      recordedAt: Value(recordedAt),
      session: Value(session),
      litres: Value(litres),
      recordedBy: recordedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(recordedBy),
      createdAt: Value(createdAt),
    );
  }

  factory LocalMilkRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalMilkRecord(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      animalId: serializer.fromJson<String>(json['animalId']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      session: serializer.fromJson<String>(json['session']),
      litres: serializer.fromJson<double>(json['litres']),
      recordedBy: serializer.fromJson<String?>(json['recordedBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'farmId': serializer.toJson<String>(farmId),
      'animalId': serializer.toJson<String>(animalId),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'session': serializer.toJson<String>(session),
      'litres': serializer.toJson<double>(litres),
      'recordedBy': serializer.toJson<String?>(recordedBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalMilkRecord copyWith({
    String? id,
    String? farmId,
    String? animalId,
    DateTime? recordedAt,
    String? session,
    double? litres,
    Value<String?> recordedBy = const Value.absent(),
    DateTime? createdAt,
  }) => LocalMilkRecord(
    id: id ?? this.id,
    farmId: farmId ?? this.farmId,
    animalId: animalId ?? this.animalId,
    recordedAt: recordedAt ?? this.recordedAt,
    session: session ?? this.session,
    litres: litres ?? this.litres,
    recordedBy: recordedBy.present ? recordedBy.value : this.recordedBy,
    createdAt: createdAt ?? this.createdAt,
  );
  LocalMilkRecord copyWithCompanion(MilkRecordsTableCompanion data) {
    return LocalMilkRecord(
      id: data.id.present ? data.id.value : this.id,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      animalId: data.animalId.present ? data.animalId.value : this.animalId,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      session: data.session.present ? data.session.value : this.session,
      litres: data.litres.present ? data.litres.value : this.litres,
      recordedBy: data.recordedBy.present
          ? data.recordedBy.value
          : this.recordedBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalMilkRecord(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('animalId: $animalId, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('session: $session, ')
          ..write('litres: $litres, ')
          ..write('recordedBy: $recordedBy, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    farmId,
    animalId,
    recordedAt,
    session,
    litres,
    recordedBy,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalMilkRecord &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.animalId == this.animalId &&
          other.recordedAt == this.recordedAt &&
          other.session == this.session &&
          other.litres == this.litres &&
          other.recordedBy == this.recordedBy &&
          other.createdAt == this.createdAt);
}

class MilkRecordsTableCompanion extends UpdateCompanion<LocalMilkRecord> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String> animalId;
  final Value<DateTime> recordedAt;
  final Value<String> session;
  final Value<double> litres;
  final Value<String?> recordedBy;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MilkRecordsTableCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.animalId = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.session = const Value.absent(),
    this.litres = const Value.absent(),
    this.recordedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MilkRecordsTableCompanion.insert({
    required String id,
    required String farmId,
    required String animalId,
    required DateTime recordedAt,
    required String session,
    required double litres,
    this.recordedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       farmId = Value(farmId),
       animalId = Value(animalId),
       recordedAt = Value(recordedAt),
       session = Value(session),
       litres = Value(litres);
  static Insertable<LocalMilkRecord> custom({
    Expression<String>? id,
    Expression<String>? farmId,
    Expression<String>? animalId,
    Expression<DateTime>? recordedAt,
    Expression<String>? session,
    Expression<double>? litres,
    Expression<String>? recordedBy,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (animalId != null) 'animal_id': animalId,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (session != null) 'session': session,
      if (litres != null) 'litres': litres,
      if (recordedBy != null) 'recorded_by': recordedBy,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MilkRecordsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? farmId,
    Value<String>? animalId,
    Value<DateTime>? recordedAt,
    Value<String>? session,
    Value<double>? litres,
    Value<String?>? recordedBy,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return MilkRecordsTableCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      animalId: animalId ?? this.animalId,
      recordedAt: recordedAt ?? this.recordedAt,
      session: session ?? this.session,
      litres: litres ?? this.litres,
      recordedBy: recordedBy ?? this.recordedBy,
      createdAt: createdAt ?? this.createdAt,
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
    if (animalId.present) {
      map['animal_id'] = Variable<String>(animalId.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (session.present) {
      map['session'] = Variable<String>(session.value);
    }
    if (litres.present) {
      map['litres'] = Variable<double>(litres.value);
    }
    if (recordedBy.present) {
      map['recorded_by'] = Variable<String>(recordedBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MilkRecordsTableCompanion(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('animalId: $animalId, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('session: $session, ')
          ..write('litres: $litres, ')
          ..write('recordedBy: $recordedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncOutboxTableTable extends SyncOutboxTable
    with TableInfo<$SyncOutboxTableTable, SyncOutboxItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncOutboxTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idempotencyKeyMeta = const VerificationMeta(
    'idempotencyKey',
  );
  @override
  late final GeneratedColumn<String> idempotencyKey = GeneratedColumn<String>(
    'idempotency_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _attemptCountMeta = const VerificationMeta(
    'attemptCount',
  );
  @override
  late final GeneratedColumn<int> attemptCount = GeneratedColumn<int>(
    'attempt_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextRetryAtMeta = const VerificationMeta(
    'nextRetryAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextRetryAt = GeneratedColumn<DateTime>(
    'next_retry_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastErrorCodeMeta = const VerificationMeta(
    'lastErrorCode',
  );
  @override
  late final GeneratedColumn<String> lastErrorCode = GeneratedColumn<String>(
    'last_error_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    operation,
    payload,
    createdAt,
    status,
    errorMessage,
    idempotencyKey,
    attemptCount,
    nextRetryAt,
    lastErrorCode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_outbox_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncOutboxItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    }
    if (data.containsKey('idempotency_key')) {
      context.handle(
        _idempotencyKeyMeta,
        idempotencyKey.isAcceptableOrUnknown(
          data['idempotency_key']!,
          _idempotencyKeyMeta,
        ),
      );
    }
    if (data.containsKey('attempt_count')) {
      context.handle(
        _attemptCountMeta,
        attemptCount.isAcceptableOrUnknown(
          data['attempt_count']!,
          _attemptCountMeta,
        ),
      );
    }
    if (data.containsKey('next_retry_at')) {
      context.handle(
        _nextRetryAtMeta,
        nextRetryAt.isAcceptableOrUnknown(
          data['next_retry_at']!,
          _nextRetryAtMeta,
        ),
      );
    }
    if (data.containsKey('last_error_code')) {
      context.handle(
        _lastErrorCodeMeta,
        lastErrorCode.isAcceptableOrUnknown(
          data['last_error_code']!,
          _lastErrorCodeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncOutboxItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncOutboxItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
      idempotencyKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idempotency_key'],
      ),
      attemptCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempt_count'],
      )!,
      nextRetryAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_retry_at'],
      ),
      lastErrorCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error_code'],
      ),
    );
  }

  @override
  $SyncOutboxTableTable createAlias(String alias) {
    return $SyncOutboxTableTable(attachedDatabase, alias);
  }
}

class SyncOutboxItem extends DataClass implements Insertable<SyncOutboxItem> {
  final int id;
  final String entityType;
  final String operation;
  final String payload;
  final DateTime createdAt;
  final String status;
  final String? errorMessage;
  final String? idempotencyKey;
  final int attemptCount;
  final DateTime? nextRetryAt;
  final String? lastErrorCode;
  const SyncOutboxItem({
    required this.id,
    required this.entityType,
    required this.operation,
    required this.payload,
    required this.createdAt,
    required this.status,
    this.errorMessage,
    this.idempotencyKey,
    required this.attemptCount,
    this.nextRetryAt,
    this.lastErrorCode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    if (!nullToAbsent || idempotencyKey != null) {
      map['idempotency_key'] = Variable<String>(idempotencyKey);
    }
    map['attempt_count'] = Variable<int>(attemptCount);
    if (!nullToAbsent || nextRetryAt != null) {
      map['next_retry_at'] = Variable<DateTime>(nextRetryAt);
    }
    if (!nullToAbsent || lastErrorCode != null) {
      map['last_error_code'] = Variable<String>(lastErrorCode);
    }
    return map;
  }

  SyncOutboxTableCompanion toCompanion(bool nullToAbsent) {
    return SyncOutboxTableCompanion(
      id: Value(id),
      entityType: Value(entityType),
      operation: Value(operation),
      payload: Value(payload),
      createdAt: Value(createdAt),
      status: Value(status),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      idempotencyKey: idempotencyKey == null && nullToAbsent
          ? const Value.absent()
          : Value(idempotencyKey),
      attemptCount: Value(attemptCount),
      nextRetryAt: nextRetryAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextRetryAt),
      lastErrorCode: lastErrorCode == null && nullToAbsent
          ? const Value.absent()
          : Value(lastErrorCode),
    );
  }

  factory SyncOutboxItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncOutboxItem(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      status: serializer.fromJson<String>(json['status']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      idempotencyKey: serializer.fromJson<String?>(json['idempotencyKey']),
      attemptCount: serializer.fromJson<int>(json['attemptCount']),
      nextRetryAt: serializer.fromJson<DateTime?>(json['nextRetryAt']),
      lastErrorCode: serializer.fromJson<String?>(json['lastErrorCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'status': serializer.toJson<String>(status),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'idempotencyKey': serializer.toJson<String?>(idempotencyKey),
      'attemptCount': serializer.toJson<int>(attemptCount),
      'nextRetryAt': serializer.toJson<DateTime?>(nextRetryAt),
      'lastErrorCode': serializer.toJson<String?>(lastErrorCode),
    };
  }

  SyncOutboxItem copyWith({
    int? id,
    String? entityType,
    String? operation,
    String? payload,
    DateTime? createdAt,
    String? status,
    Value<String?> errorMessage = const Value.absent(),
    Value<String?> idempotencyKey = const Value.absent(),
    int? attemptCount,
    Value<DateTime?> nextRetryAt = const Value.absent(),
    Value<String?> lastErrorCode = const Value.absent(),
  }) => SyncOutboxItem(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    operation: operation ?? this.operation,
    payload: payload ?? this.payload,
    createdAt: createdAt ?? this.createdAt,
    status: status ?? this.status,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
    idempotencyKey: idempotencyKey.present
        ? idempotencyKey.value
        : this.idempotencyKey,
    attemptCount: attemptCount ?? this.attemptCount,
    nextRetryAt: nextRetryAt.present ? nextRetryAt.value : this.nextRetryAt,
    lastErrorCode: lastErrorCode.present
        ? lastErrorCode.value
        : this.lastErrorCode,
  );
  SyncOutboxItem copyWithCompanion(SyncOutboxTableCompanion data) {
    return SyncOutboxItem(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      status: data.status.present ? data.status.value : this.status,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      idempotencyKey: data.idempotencyKey.present
          ? data.idempotencyKey.value
          : this.idempotencyKey,
      attemptCount: data.attemptCount.present
          ? data.attemptCount.value
          : this.attemptCount,
      nextRetryAt: data.nextRetryAt.present
          ? data.nextRetryAt.value
          : this.nextRetryAt,
      lastErrorCode: data.lastErrorCode.present
          ? data.lastErrorCode.value
          : this.lastErrorCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxItem(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('nextRetryAt: $nextRetryAt, ')
          ..write('lastErrorCode: $lastErrorCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    operation,
    payload,
    createdAt,
    status,
    errorMessage,
    idempotencyKey,
    attemptCount,
    nextRetryAt,
    lastErrorCode,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncOutboxItem &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.status == this.status &&
          other.errorMessage == this.errorMessage &&
          other.idempotencyKey == this.idempotencyKey &&
          other.attemptCount == this.attemptCount &&
          other.nextRetryAt == this.nextRetryAt &&
          other.lastErrorCode == this.lastErrorCode);
}

class SyncOutboxTableCompanion extends UpdateCompanion<SyncOutboxItem> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> operation;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<String> status;
  final Value<String?> errorMessage;
  final Value<String?> idempotencyKey;
  final Value<int> attemptCount;
  final Value<DateTime?> nextRetryAt;
  final Value<String?> lastErrorCode;
  const SyncOutboxTableCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.idempotencyKey = const Value.absent(),
    this.attemptCount = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
    this.lastErrorCode = const Value.absent(),
  });
  SyncOutboxTableCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String operation,
    required String payload,
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.idempotencyKey = const Value.absent(),
    this.attemptCount = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
    this.lastErrorCode = const Value.absent(),
  }) : entityType = Value(entityType),
       operation = Value(operation),
       payload = Value(payload);
  static Insertable<SyncOutboxItem> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<String>? status,
    Expression<String>? errorMessage,
    Expression<String>? idempotencyKey,
    Expression<int>? attemptCount,
    Expression<DateTime>? nextRetryAt,
    Expression<String>? lastErrorCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (status != null) 'status': status,
      if (errorMessage != null) 'error_message': errorMessage,
      if (idempotencyKey != null) 'idempotency_key': idempotencyKey,
      if (attemptCount != null) 'attempt_count': attemptCount,
      if (nextRetryAt != null) 'next_retry_at': nextRetryAt,
      if (lastErrorCode != null) 'last_error_code': lastErrorCode,
    });
  }

  SyncOutboxTableCompanion copyWith({
    Value<int>? id,
    Value<String>? entityType,
    Value<String>? operation,
    Value<String>? payload,
    Value<DateTime>? createdAt,
    Value<String>? status,
    Value<String?>? errorMessage,
    Value<String?>? idempotencyKey,
    Value<int>? attemptCount,
    Value<DateTime?>? nextRetryAt,
    Value<String?>? lastErrorCode,
  }) {
    return SyncOutboxTableCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      attemptCount: attemptCount ?? this.attemptCount,
      nextRetryAt: nextRetryAt ?? this.nextRetryAt,
      lastErrorCode: lastErrorCode ?? this.lastErrorCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (idempotencyKey.present) {
      map['idempotency_key'] = Variable<String>(idempotencyKey.value);
    }
    if (attemptCount.present) {
      map['attempt_count'] = Variable<int>(attemptCount.value);
    }
    if (nextRetryAt.present) {
      map['next_retry_at'] = Variable<DateTime>(nextRetryAt.value);
    }
    if (lastErrorCode.present) {
      map['last_error_code'] = Variable<String>(lastErrorCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxTableCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('nextRetryAt: $nextRetryAt, ')
          ..write('lastErrorCode: $lastErrorCode')
          ..write(')'))
        .toString();
  }
}

class $FeedTypesTableTable extends FeedTypesTable
    with TableInfo<$FeedTypesTableTable, LocalFeedType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedTypesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('kg'),
  );
  static const VerificationMeta _unitCostMeta = const VerificationMeta(
    'unitCost',
  );
  @override
  late final GeneratedColumn<double> unitCost = GeneratedColumn<double>(
    'unit_cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    farmId,
    name,
    unit,
    unitCost,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feed_types_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalFeedType> instance, {
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('unit_cost')) {
      context.handle(
        _unitCostMeta,
        unitCost.isAcceptableOrUnknown(data['unit_cost']!, _unitCostMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalFeedType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalFeedType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      unitCost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_cost'],
      )!,
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
  $FeedTypesTableTable createAlias(String alias) {
    return $FeedTypesTableTable(attachedDatabase, alias);
  }
}

class LocalFeedType extends DataClass implements Insertable<LocalFeedType> {
  final String id;
  final String farmId;
  final String name;
  final String unit;
  final double unitCost;
  final DateTime createdAt;
  final DateTime updatedAt;
  const LocalFeedType({
    required this.id,
    required this.farmId,
    required this.name,
    required this.unit,
    required this.unitCost,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['farm_id'] = Variable<String>(farmId);
    map['name'] = Variable<String>(name);
    map['unit'] = Variable<String>(unit);
    map['unit_cost'] = Variable<double>(unitCost);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FeedTypesTableCompanion toCompanion(bool nullToAbsent) {
    return FeedTypesTableCompanion(
      id: Value(id),
      farmId: Value(farmId),
      name: Value(name),
      unit: Value(unit),
      unitCost: Value(unitCost),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalFeedType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalFeedType(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      name: serializer.fromJson<String>(json['name']),
      unit: serializer.fromJson<String>(json['unit']),
      unitCost: serializer.fromJson<double>(json['unitCost']),
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
      'name': serializer.toJson<String>(name),
      'unit': serializer.toJson<String>(unit),
      'unitCost': serializer.toJson<double>(unitCost),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalFeedType copyWith({
    String? id,
    String? farmId,
    String? name,
    String? unit,
    double? unitCost,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => LocalFeedType(
    id: id ?? this.id,
    farmId: farmId ?? this.farmId,
    name: name ?? this.name,
    unit: unit ?? this.unit,
    unitCost: unitCost ?? this.unitCost,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LocalFeedType copyWithCompanion(FeedTypesTableCompanion data) {
    return LocalFeedType(
      id: data.id.present ? data.id.value : this.id,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      name: data.name.present ? data.name.value : this.name,
      unit: data.unit.present ? data.unit.value : this.unit,
      unitCost: data.unitCost.present ? data.unitCost.value : this.unitCost,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalFeedType(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('unitCost: $unitCost, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, farmId, name, unit, unitCost, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalFeedType &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.name == this.name &&
          other.unit == this.unit &&
          other.unitCost == this.unitCost &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FeedTypesTableCompanion extends UpdateCompanion<LocalFeedType> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String> name;
  final Value<String> unit;
  final Value<double> unitCost;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const FeedTypesTableCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.name = const Value.absent(),
    this.unit = const Value.absent(),
    this.unitCost = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FeedTypesTableCompanion.insert({
    required String id,
    required String farmId,
    required String name,
    this.unit = const Value.absent(),
    this.unitCost = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       farmId = Value(farmId),
       name = Value(name);
  static Insertable<LocalFeedType> custom({
    Expression<String>? id,
    Expression<String>? farmId,
    Expression<String>? name,
    Expression<String>? unit,
    Expression<double>? unitCost,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (name != null) 'name': name,
      if (unit != null) 'unit': unit,
      if (unitCost != null) 'unit_cost': unitCost,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FeedTypesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? farmId,
    Value<String>? name,
    Value<String>? unit,
    Value<double>? unitCost,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return FeedTypesTableCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      unitCost: unitCost ?? this.unitCost,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (unitCost.present) {
      map['unit_cost'] = Variable<double>(unitCost.value);
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
    return (StringBuffer('FeedTypesTableCompanion(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('unitCost: $unitCost, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FeedRecordsTableTable extends FeedRecordsTable
    with TableInfo<$FeedRecordsTableTable, LocalFeedRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedRecordsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _animalIdMeta = const VerificationMeta(
    'animalId',
  );
  @override
  late final GeneratedColumn<String> animalId = GeneratedColumn<String>(
    'animal_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _feedTypeIdMeta = const VerificationMeta(
    'feedTypeId',
  );
  @override
  late final GeneratedColumn<String> feedTypeId = GeneratedColumn<String>(
    'feed_type_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityKgMeta = const VerificationMeta(
    'quantityKg',
  );
  @override
  late final GeneratedColumn<double> quantityKg = GeneratedColumn<double>(
    'quantity_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByMeta = const VerificationMeta(
    'recordedBy',
  );
  @override
  late final GeneratedColumn<String> recordedBy = GeneratedColumn<String>(
    'recorded_by',
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    farmId,
    animalId,
    feedTypeId,
    quantityKg,
    cost,
    recordedAt,
    recordedBy,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feed_records_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalFeedRecord> instance, {
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
    if (data.containsKey('animal_id')) {
      context.handle(
        _animalIdMeta,
        animalId.isAcceptableOrUnknown(data['animal_id']!, _animalIdMeta),
      );
    }
    if (data.containsKey('feed_type_id')) {
      context.handle(
        _feedTypeIdMeta,
        feedTypeId.isAcceptableOrUnknown(
          data['feed_type_id']!,
          _feedTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_feedTypeIdMeta);
    }
    if (data.containsKey('quantity_kg')) {
      context.handle(
        _quantityKgMeta,
        quantityKg.isAcceptableOrUnknown(data['quantity_kg']!, _quantityKgMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityKgMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    } else if (isInserting) {
      context.missing(_costMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('recorded_by')) {
      context.handle(
        _recordedByMeta,
        recordedBy.isAcceptableOrUnknown(data['recorded_by']!, _recordedByMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalFeedRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalFeedRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      animalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}animal_id'],
      ),
      feedTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}feed_type_id'],
      )!,
      quantityKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity_kg'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      recordedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FeedRecordsTableTable createAlias(String alias) {
    return $FeedRecordsTableTable(attachedDatabase, alias);
  }
}

class LocalFeedRecord extends DataClass implements Insertable<LocalFeedRecord> {
  final String id;
  final String farmId;
  final String? animalId;
  final String feedTypeId;
  final double quantityKg;
  final double cost;
  final DateTime recordedAt;
  final String? recordedBy;
  final DateTime createdAt;
  const LocalFeedRecord({
    required this.id,
    required this.farmId,
    this.animalId,
    required this.feedTypeId,
    required this.quantityKg,
    required this.cost,
    required this.recordedAt,
    this.recordedBy,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['farm_id'] = Variable<String>(farmId);
    if (!nullToAbsent || animalId != null) {
      map['animal_id'] = Variable<String>(animalId);
    }
    map['feed_type_id'] = Variable<String>(feedTypeId);
    map['quantity_kg'] = Variable<double>(quantityKg);
    map['cost'] = Variable<double>(cost);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    if (!nullToAbsent || recordedBy != null) {
      map['recorded_by'] = Variable<String>(recordedBy);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FeedRecordsTableCompanion toCompanion(bool nullToAbsent) {
    return FeedRecordsTableCompanion(
      id: Value(id),
      farmId: Value(farmId),
      animalId: animalId == null && nullToAbsent
          ? const Value.absent()
          : Value(animalId),
      feedTypeId: Value(feedTypeId),
      quantityKg: Value(quantityKg),
      cost: Value(cost),
      recordedAt: Value(recordedAt),
      recordedBy: recordedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(recordedBy),
      createdAt: Value(createdAt),
    );
  }

  factory LocalFeedRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalFeedRecord(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      animalId: serializer.fromJson<String?>(json['animalId']),
      feedTypeId: serializer.fromJson<String>(json['feedTypeId']),
      quantityKg: serializer.fromJson<double>(json['quantityKg']),
      cost: serializer.fromJson<double>(json['cost']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      recordedBy: serializer.fromJson<String?>(json['recordedBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'farmId': serializer.toJson<String>(farmId),
      'animalId': serializer.toJson<String?>(animalId),
      'feedTypeId': serializer.toJson<String>(feedTypeId),
      'quantityKg': serializer.toJson<double>(quantityKg),
      'cost': serializer.toJson<double>(cost),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'recordedBy': serializer.toJson<String?>(recordedBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalFeedRecord copyWith({
    String? id,
    String? farmId,
    Value<String?> animalId = const Value.absent(),
    String? feedTypeId,
    double? quantityKg,
    double? cost,
    DateTime? recordedAt,
    Value<String?> recordedBy = const Value.absent(),
    DateTime? createdAt,
  }) => LocalFeedRecord(
    id: id ?? this.id,
    farmId: farmId ?? this.farmId,
    animalId: animalId.present ? animalId.value : this.animalId,
    feedTypeId: feedTypeId ?? this.feedTypeId,
    quantityKg: quantityKg ?? this.quantityKg,
    cost: cost ?? this.cost,
    recordedAt: recordedAt ?? this.recordedAt,
    recordedBy: recordedBy.present ? recordedBy.value : this.recordedBy,
    createdAt: createdAt ?? this.createdAt,
  );
  LocalFeedRecord copyWithCompanion(FeedRecordsTableCompanion data) {
    return LocalFeedRecord(
      id: data.id.present ? data.id.value : this.id,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      animalId: data.animalId.present ? data.animalId.value : this.animalId,
      feedTypeId: data.feedTypeId.present
          ? data.feedTypeId.value
          : this.feedTypeId,
      quantityKg: data.quantityKg.present
          ? data.quantityKg.value
          : this.quantityKg,
      cost: data.cost.present ? data.cost.value : this.cost,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      recordedBy: data.recordedBy.present
          ? data.recordedBy.value
          : this.recordedBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalFeedRecord(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('animalId: $animalId, ')
          ..write('feedTypeId: $feedTypeId, ')
          ..write('quantityKg: $quantityKg, ')
          ..write('cost: $cost, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('recordedBy: $recordedBy, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    farmId,
    animalId,
    feedTypeId,
    quantityKg,
    cost,
    recordedAt,
    recordedBy,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalFeedRecord &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.animalId == this.animalId &&
          other.feedTypeId == this.feedTypeId &&
          other.quantityKg == this.quantityKg &&
          other.cost == this.cost &&
          other.recordedAt == this.recordedAt &&
          other.recordedBy == this.recordedBy &&
          other.createdAt == this.createdAt);
}

class FeedRecordsTableCompanion extends UpdateCompanion<LocalFeedRecord> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String?> animalId;
  final Value<String> feedTypeId;
  final Value<double> quantityKg;
  final Value<double> cost;
  final Value<DateTime> recordedAt;
  final Value<String?> recordedBy;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FeedRecordsTableCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.animalId = const Value.absent(),
    this.feedTypeId = const Value.absent(),
    this.quantityKg = const Value.absent(),
    this.cost = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.recordedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FeedRecordsTableCompanion.insert({
    required String id,
    required String farmId,
    this.animalId = const Value.absent(),
    required String feedTypeId,
    required double quantityKg,
    required double cost,
    required DateTime recordedAt,
    this.recordedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       farmId = Value(farmId),
       feedTypeId = Value(feedTypeId),
       quantityKg = Value(quantityKg),
       cost = Value(cost),
       recordedAt = Value(recordedAt);
  static Insertable<LocalFeedRecord> custom({
    Expression<String>? id,
    Expression<String>? farmId,
    Expression<String>? animalId,
    Expression<String>? feedTypeId,
    Expression<double>? quantityKg,
    Expression<double>? cost,
    Expression<DateTime>? recordedAt,
    Expression<String>? recordedBy,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (animalId != null) 'animal_id': animalId,
      if (feedTypeId != null) 'feed_type_id': feedTypeId,
      if (quantityKg != null) 'quantity_kg': quantityKg,
      if (cost != null) 'cost': cost,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (recordedBy != null) 'recorded_by': recordedBy,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FeedRecordsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? farmId,
    Value<String?>? animalId,
    Value<String>? feedTypeId,
    Value<double>? quantityKg,
    Value<double>? cost,
    Value<DateTime>? recordedAt,
    Value<String?>? recordedBy,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FeedRecordsTableCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      animalId: animalId ?? this.animalId,
      feedTypeId: feedTypeId ?? this.feedTypeId,
      quantityKg: quantityKg ?? this.quantityKg,
      cost: cost ?? this.cost,
      recordedAt: recordedAt ?? this.recordedAt,
      recordedBy: recordedBy ?? this.recordedBy,
      createdAt: createdAt ?? this.createdAt,
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
    if (animalId.present) {
      map['animal_id'] = Variable<String>(animalId.value);
    }
    if (feedTypeId.present) {
      map['feed_type_id'] = Variable<String>(feedTypeId.value);
    }
    if (quantityKg.present) {
      map['quantity_kg'] = Variable<double>(quantityKg.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (recordedBy.present) {
      map['recorded_by'] = Variable<String>(recordedBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedRecordsTableCompanion(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('animalId: $animalId, ')
          ..write('feedTypeId: $feedTypeId, ')
          ..write('quantityKg: $quantityKg, ')
          ..write('cost: $cost, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('recordedBy: $recordedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EggRecordsTableTable extends EggRecordsTable
    with TableInfo<$EggRecordsTableTable, LocalEggRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EggRecordsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _flockNameMeta = const VerificationMeta(
    'flockName',
  );
  @override
  late final GeneratedColumn<String> flockName = GeneratedColumn<String>(
    'flock_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productionTypeMeta = const VerificationMeta(
    'productionType',
  );
  @override
  late final GeneratedColumn<String> productionType = GeneratedColumn<String>(
    'production_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('free_range'),
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brokenCountMeta = const VerificationMeta(
    'brokenCount',
  );
  @override
  late final GeneratedColumn<int> brokenCount = GeneratedColumn<int>(
    'broken_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedByMeta = const VerificationMeta(
    'recordedBy',
  );
  @override
  late final GeneratedColumn<String> recordedBy = GeneratedColumn<String>(
    'recorded_by',
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    farmId,
    flockName,
    productionType,
    recordedAt,
    quantity,
    brokenCount,
    notes,
    recordedBy,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'egg_records_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalEggRecord> instance, {
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
    if (data.containsKey('flock_name')) {
      context.handle(
        _flockNameMeta,
        flockName.isAcceptableOrUnknown(data['flock_name']!, _flockNameMeta),
      );
    } else if (isInserting) {
      context.missing(_flockNameMeta);
    }
    if (data.containsKey('production_type')) {
      context.handle(
        _productionTypeMeta,
        productionType.isAcceptableOrUnknown(
          data['production_type']!,
          _productionTypeMeta,
        ),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('broken_count')) {
      context.handle(
        _brokenCountMeta,
        brokenCount.isAcceptableOrUnknown(
          data['broken_count']!,
          _brokenCountMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('recorded_by')) {
      context.handle(
        _recordedByMeta,
        recordedBy.isAcceptableOrUnknown(data['recorded_by']!, _recordedByMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalEggRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalEggRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      flockName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flock_name'],
      )!,
      productionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}production_type'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      brokenCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}broken_count'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      recordedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $EggRecordsTableTable createAlias(String alias) {
    return $EggRecordsTableTable(attachedDatabase, alias);
  }
}

class LocalEggRecord extends DataClass implements Insertable<LocalEggRecord> {
  final String id;
  final String farmId;
  final String flockName;
  final String productionType;
  final DateTime recordedAt;
  final int quantity;
  final int brokenCount;
  final String? notes;
  final String? recordedBy;
  final DateTime createdAt;
  const LocalEggRecord({
    required this.id,
    required this.farmId,
    required this.flockName,
    required this.productionType,
    required this.recordedAt,
    required this.quantity,
    required this.brokenCount,
    this.notes,
    this.recordedBy,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['farm_id'] = Variable<String>(farmId);
    map['flock_name'] = Variable<String>(flockName);
    map['production_type'] = Variable<String>(productionType);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    map['quantity'] = Variable<int>(quantity);
    map['broken_count'] = Variable<int>(brokenCount);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || recordedBy != null) {
      map['recorded_by'] = Variable<String>(recordedBy);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  EggRecordsTableCompanion toCompanion(bool nullToAbsent) {
    return EggRecordsTableCompanion(
      id: Value(id),
      farmId: Value(farmId),
      flockName: Value(flockName),
      productionType: Value(productionType),
      recordedAt: Value(recordedAt),
      quantity: Value(quantity),
      brokenCount: Value(brokenCount),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      recordedBy: recordedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(recordedBy),
      createdAt: Value(createdAt),
    );
  }

  factory LocalEggRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalEggRecord(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      flockName: serializer.fromJson<String>(json['flockName']),
      productionType: serializer.fromJson<String>(json['productionType']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      quantity: serializer.fromJson<int>(json['quantity']),
      brokenCount: serializer.fromJson<int>(json['brokenCount']),
      notes: serializer.fromJson<String?>(json['notes']),
      recordedBy: serializer.fromJson<String?>(json['recordedBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'farmId': serializer.toJson<String>(farmId),
      'flockName': serializer.toJson<String>(flockName),
      'productionType': serializer.toJson<String>(productionType),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'quantity': serializer.toJson<int>(quantity),
      'brokenCount': serializer.toJson<int>(brokenCount),
      'notes': serializer.toJson<String?>(notes),
      'recordedBy': serializer.toJson<String?>(recordedBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalEggRecord copyWith({
    String? id,
    String? farmId,
    String? flockName,
    String? productionType,
    DateTime? recordedAt,
    int? quantity,
    int? brokenCount,
    Value<String?> notes = const Value.absent(),
    Value<String?> recordedBy = const Value.absent(),
    DateTime? createdAt,
  }) => LocalEggRecord(
    id: id ?? this.id,
    farmId: farmId ?? this.farmId,
    flockName: flockName ?? this.flockName,
    productionType: productionType ?? this.productionType,
    recordedAt: recordedAt ?? this.recordedAt,
    quantity: quantity ?? this.quantity,
    brokenCount: brokenCount ?? this.brokenCount,
    notes: notes.present ? notes.value : this.notes,
    recordedBy: recordedBy.present ? recordedBy.value : this.recordedBy,
    createdAt: createdAt ?? this.createdAt,
  );
  LocalEggRecord copyWithCompanion(EggRecordsTableCompanion data) {
    return LocalEggRecord(
      id: data.id.present ? data.id.value : this.id,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      flockName: data.flockName.present ? data.flockName.value : this.flockName,
      productionType: data.productionType.present
          ? data.productionType.value
          : this.productionType,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      brokenCount: data.brokenCount.present
          ? data.brokenCount.value
          : this.brokenCount,
      notes: data.notes.present ? data.notes.value : this.notes,
      recordedBy: data.recordedBy.present
          ? data.recordedBy.value
          : this.recordedBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalEggRecord(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('flockName: $flockName, ')
          ..write('productionType: $productionType, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('quantity: $quantity, ')
          ..write('brokenCount: $brokenCount, ')
          ..write('notes: $notes, ')
          ..write('recordedBy: $recordedBy, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    farmId,
    flockName,
    productionType,
    recordedAt,
    quantity,
    brokenCount,
    notes,
    recordedBy,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalEggRecord &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.flockName == this.flockName &&
          other.productionType == this.productionType &&
          other.recordedAt == this.recordedAt &&
          other.quantity == this.quantity &&
          other.brokenCount == this.brokenCount &&
          other.notes == this.notes &&
          other.recordedBy == this.recordedBy &&
          other.createdAt == this.createdAt);
}

class EggRecordsTableCompanion extends UpdateCompanion<LocalEggRecord> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String> flockName;
  final Value<String> productionType;
  final Value<DateTime> recordedAt;
  final Value<int> quantity;
  final Value<int> brokenCount;
  final Value<String?> notes;
  final Value<String?> recordedBy;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const EggRecordsTableCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.flockName = const Value.absent(),
    this.productionType = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.quantity = const Value.absent(),
    this.brokenCount = const Value.absent(),
    this.notes = const Value.absent(),
    this.recordedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EggRecordsTableCompanion.insert({
    required String id,
    required String farmId,
    required String flockName,
    this.productionType = const Value.absent(),
    required DateTime recordedAt,
    required int quantity,
    this.brokenCount = const Value.absent(),
    this.notes = const Value.absent(),
    this.recordedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       farmId = Value(farmId),
       flockName = Value(flockName),
       recordedAt = Value(recordedAt),
       quantity = Value(quantity);
  static Insertable<LocalEggRecord> custom({
    Expression<String>? id,
    Expression<String>? farmId,
    Expression<String>? flockName,
    Expression<String>? productionType,
    Expression<DateTime>? recordedAt,
    Expression<int>? quantity,
    Expression<int>? brokenCount,
    Expression<String>? notes,
    Expression<String>? recordedBy,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (flockName != null) 'flock_name': flockName,
      if (productionType != null) 'production_type': productionType,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (quantity != null) 'quantity': quantity,
      if (brokenCount != null) 'broken_count': brokenCount,
      if (notes != null) 'notes': notes,
      if (recordedBy != null) 'recorded_by': recordedBy,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EggRecordsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? farmId,
    Value<String>? flockName,
    Value<String>? productionType,
    Value<DateTime>? recordedAt,
    Value<int>? quantity,
    Value<int>? brokenCount,
    Value<String?>? notes,
    Value<String?>? recordedBy,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return EggRecordsTableCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      flockName: flockName ?? this.flockName,
      productionType: productionType ?? this.productionType,
      recordedAt: recordedAt ?? this.recordedAt,
      quantity: quantity ?? this.quantity,
      brokenCount: brokenCount ?? this.brokenCount,
      notes: notes ?? this.notes,
      recordedBy: recordedBy ?? this.recordedBy,
      createdAt: createdAt ?? this.createdAt,
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
    if (flockName.present) {
      map['flock_name'] = Variable<String>(flockName.value);
    }
    if (productionType.present) {
      map['production_type'] = Variable<String>(productionType.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (brokenCount.present) {
      map['broken_count'] = Variable<int>(brokenCount.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (recordedBy.present) {
      map['recorded_by'] = Variable<String>(recordedBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EggRecordsTableCompanion(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('flockName: $flockName, ')
          ..write('productionType: $productionType, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('quantity: $quantity, ')
          ..write('brokenCount: $brokenCount, ')
          ..write('notes: $notes, ')
          ..write('recordedBy: $recordedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FlocksTableTable extends FlocksTable
    with TableInfo<$FlocksTableTable, LocalFlock> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlocksTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _flockCodeMeta = const VerificationMeta(
    'flockCode',
  );
  @override
  late final GeneratedColumn<String> flockCode = GeneratedColumn<String>(
    'flock_code',
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
    'breed',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _purposeMeta = const VerificationMeta(
    'purpose',
  );
  @override
  late final GeneratedColumn<String> purpose = GeneratedColumn<String>(
    'purpose',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('layers'),
  );
  static const VerificationMeta _numberOfBirdsMeta = const VerificationMeta(
    'numberOfBirds',
  );
  @override
  late final GeneratedColumn<int> numberOfBirds = GeneratedColumn<int>(
    'number_of_birds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _numberOfLayingHensMeta =
      const VerificationMeta('numberOfLayingHens');
  @override
  late final GeneratedColumn<int> numberOfLayingHens = GeneratedColumn<int>(
    'number_of_laying_hens',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _arrivalDateMeta = const VerificationMeta(
    'arrivalDate',
  );
  @override
  late final GeneratedColumn<DateTime> arrivalDate = GeneratedColumn<DateTime>(
    'arrival_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hatchDateMeta = const VerificationMeta(
    'hatchDate',
  );
  @override
  late final GeneratedColumn<DateTime> hatchDate = GeneratedColumn<DateTime>(
    'hatch_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _housingTypeMeta = const VerificationMeta(
    'housingType',
  );
  @override
  late final GeneratedColumn<String> housingType = GeneratedColumn<String>(
    'housing_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    farmId,
    flockCode,
    name,
    breed,
    purpose,
    numberOfBirds,
    numberOfLayingHens,
    arrivalDate,
    hatchDate,
    housingType,
    source,
    status,
    notes,
    createdBy,
    createdAt,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flocks_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalFlock> instance, {
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
    if (data.containsKey('flock_code')) {
      context.handle(
        _flockCodeMeta,
        flockCode.isAcceptableOrUnknown(data['flock_code']!, _flockCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_flockCodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
        _breedMeta,
        breed.isAcceptableOrUnknown(data['breed']!, _breedMeta),
      );
    } else if (isInserting) {
      context.missing(_breedMeta);
    }
    if (data.containsKey('purpose')) {
      context.handle(
        _purposeMeta,
        purpose.isAcceptableOrUnknown(data['purpose']!, _purposeMeta),
      );
    }
    if (data.containsKey('number_of_birds')) {
      context.handle(
        _numberOfBirdsMeta,
        numberOfBirds.isAcceptableOrUnknown(
          data['number_of_birds']!,
          _numberOfBirdsMeta,
        ),
      );
    }
    if (data.containsKey('number_of_laying_hens')) {
      context.handle(
        _numberOfLayingHensMeta,
        numberOfLayingHens.isAcceptableOrUnknown(
          data['number_of_laying_hens']!,
          _numberOfLayingHensMeta,
        ),
      );
    }
    if (data.containsKey('arrival_date')) {
      context.handle(
        _arrivalDateMeta,
        arrivalDate.isAcceptableOrUnknown(
          data['arrival_date']!,
          _arrivalDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_arrivalDateMeta);
    }
    if (data.containsKey('hatch_date')) {
      context.handle(
        _hatchDateMeta,
        hatchDate.isAcceptableOrUnknown(data['hatch_date']!, _hatchDateMeta),
      );
    }
    if (data.containsKey('housing_type')) {
      context.handle(
        _housingTypeMeta,
        housingType.isAcceptableOrUnknown(
          data['housing_type']!,
          _housingTypeMeta,
        ),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalFlock map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalFlock(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      flockCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flock_code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      breed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed'],
      )!,
      purpose: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purpose'],
      )!,
      numberOfBirds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_birds'],
      )!,
      numberOfLayingHens: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_laying_hens'],
      )!,
      arrivalDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}arrival_date'],
      )!,
      hatchDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hatch_date'],
      ),
      housingType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}housing_type'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $FlocksTableTable createAlias(String alias) {
    return $FlocksTableTable(attachedDatabase, alias);
  }
}

class LocalFlock extends DataClass implements Insertable<LocalFlock> {
  final String id;
  final String farmId;
  final String flockCode;
  final String name;
  final String breed;
  final String purpose;
  final int numberOfBirds;
  final int numberOfLayingHens;
  final DateTime arrivalDate;
  final DateTime? hatchDate;
  final String? housingType;
  final String? source;
  final String status;
  final String? notes;
  final String? createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const LocalFlock({
    required this.id,
    required this.farmId,
    required this.flockCode,
    required this.name,
    required this.breed,
    required this.purpose,
    required this.numberOfBirds,
    required this.numberOfLayingHens,
    required this.arrivalDate,
    this.hatchDate,
    this.housingType,
    this.source,
    required this.status,
    this.notes,
    this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['farm_id'] = Variable<String>(farmId);
    map['flock_code'] = Variable<String>(flockCode);
    map['name'] = Variable<String>(name);
    map['breed'] = Variable<String>(breed);
    map['purpose'] = Variable<String>(purpose);
    map['number_of_birds'] = Variable<int>(numberOfBirds);
    map['number_of_laying_hens'] = Variable<int>(numberOfLayingHens);
    map['arrival_date'] = Variable<DateTime>(arrivalDate);
    if (!nullToAbsent || hatchDate != null) {
      map['hatch_date'] = Variable<DateTime>(hatchDate);
    }
    if (!nullToAbsent || housingType != null) {
      map['housing_type'] = Variable<String>(housingType);
    }
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  FlocksTableCompanion toCompanion(bool nullToAbsent) {
    return FlocksTableCompanion(
      id: Value(id),
      farmId: Value(farmId),
      flockCode: Value(flockCode),
      name: Value(name),
      breed: Value(breed),
      purpose: Value(purpose),
      numberOfBirds: Value(numberOfBirds),
      numberOfLayingHens: Value(numberOfLayingHens),
      arrivalDate: Value(arrivalDate),
      hatchDate: hatchDate == null && nullToAbsent
          ? const Value.absent()
          : Value(hatchDate),
      housingType: housingType == null && nullToAbsent
          ? const Value.absent()
          : Value(housingType),
      source: source == null && nullToAbsent
          ? const Value.absent()
          : Value(source),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory LocalFlock.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalFlock(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      flockCode: serializer.fromJson<String>(json['flockCode']),
      name: serializer.fromJson<String>(json['name']),
      breed: serializer.fromJson<String>(json['breed']),
      purpose: serializer.fromJson<String>(json['purpose']),
      numberOfBirds: serializer.fromJson<int>(json['numberOfBirds']),
      numberOfLayingHens: serializer.fromJson<int>(json['numberOfLayingHens']),
      arrivalDate: serializer.fromJson<DateTime>(json['arrivalDate']),
      hatchDate: serializer.fromJson<DateTime?>(json['hatchDate']),
      housingType: serializer.fromJson<String?>(json['housingType']),
      source: serializer.fromJson<String?>(json['source']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'farmId': serializer.toJson<String>(farmId),
      'flockCode': serializer.toJson<String>(flockCode),
      'name': serializer.toJson<String>(name),
      'breed': serializer.toJson<String>(breed),
      'purpose': serializer.toJson<String>(purpose),
      'numberOfBirds': serializer.toJson<int>(numberOfBirds),
      'numberOfLayingHens': serializer.toJson<int>(numberOfLayingHens),
      'arrivalDate': serializer.toJson<DateTime>(arrivalDate),
      'hatchDate': serializer.toJson<DateTime?>(hatchDate),
      'housingType': serializer.toJson<String?>(housingType),
      'source': serializer.toJson<String?>(source),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'createdBy': serializer.toJson<String?>(createdBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  LocalFlock copyWith({
    String? id,
    String? farmId,
    String? flockCode,
    String? name,
    String? breed,
    String? purpose,
    int? numberOfBirds,
    int? numberOfLayingHens,
    DateTime? arrivalDate,
    Value<DateTime?> hatchDate = const Value.absent(),
    Value<String?> housingType = const Value.absent(),
    Value<String?> source = const Value.absent(),
    String? status,
    Value<String?> notes = const Value.absent(),
    Value<String?> createdBy = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => LocalFlock(
    id: id ?? this.id,
    farmId: farmId ?? this.farmId,
    flockCode: flockCode ?? this.flockCode,
    name: name ?? this.name,
    breed: breed ?? this.breed,
    purpose: purpose ?? this.purpose,
    numberOfBirds: numberOfBirds ?? this.numberOfBirds,
    numberOfLayingHens: numberOfLayingHens ?? this.numberOfLayingHens,
    arrivalDate: arrivalDate ?? this.arrivalDate,
    hatchDate: hatchDate.present ? hatchDate.value : this.hatchDate,
    housingType: housingType.present ? housingType.value : this.housingType,
    source: source.present ? source.value : this.source,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  LocalFlock copyWithCompanion(FlocksTableCompanion data) {
    return LocalFlock(
      id: data.id.present ? data.id.value : this.id,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      flockCode: data.flockCode.present ? data.flockCode.value : this.flockCode,
      name: data.name.present ? data.name.value : this.name,
      breed: data.breed.present ? data.breed.value : this.breed,
      purpose: data.purpose.present ? data.purpose.value : this.purpose,
      numberOfBirds: data.numberOfBirds.present
          ? data.numberOfBirds.value
          : this.numberOfBirds,
      numberOfLayingHens: data.numberOfLayingHens.present
          ? data.numberOfLayingHens.value
          : this.numberOfLayingHens,
      arrivalDate: data.arrivalDate.present
          ? data.arrivalDate.value
          : this.arrivalDate,
      hatchDate: data.hatchDate.present ? data.hatchDate.value : this.hatchDate,
      housingType: data.housingType.present
          ? data.housingType.value
          : this.housingType,
      source: data.source.present ? data.source.value : this.source,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalFlock(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('flockCode: $flockCode, ')
          ..write('name: $name, ')
          ..write('breed: $breed, ')
          ..write('purpose: $purpose, ')
          ..write('numberOfBirds: $numberOfBirds, ')
          ..write('numberOfLayingHens: $numberOfLayingHens, ')
          ..write('arrivalDate: $arrivalDate, ')
          ..write('hatchDate: $hatchDate, ')
          ..write('housingType: $housingType, ')
          ..write('source: $source, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    farmId,
    flockCode,
    name,
    breed,
    purpose,
    numberOfBirds,
    numberOfLayingHens,
    arrivalDate,
    hatchDate,
    housingType,
    source,
    status,
    notes,
    createdBy,
    createdAt,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalFlock &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.flockCode == this.flockCode &&
          other.name == this.name &&
          other.breed == this.breed &&
          other.purpose == this.purpose &&
          other.numberOfBirds == this.numberOfBirds &&
          other.numberOfLayingHens == this.numberOfLayingHens &&
          other.arrivalDate == this.arrivalDate &&
          other.hatchDate == this.hatchDate &&
          other.housingType == this.housingType &&
          other.source == this.source &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class FlocksTableCompanion extends UpdateCompanion<LocalFlock> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String> flockCode;
  final Value<String> name;
  final Value<String> breed;
  final Value<String> purpose;
  final Value<int> numberOfBirds;
  final Value<int> numberOfLayingHens;
  final Value<DateTime> arrivalDate;
  final Value<DateTime?> hatchDate;
  final Value<String?> housingType;
  final Value<String?> source;
  final Value<String> status;
  final Value<String?> notes;
  final Value<String?> createdBy;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const FlocksTableCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.flockCode = const Value.absent(),
    this.name = const Value.absent(),
    this.breed = const Value.absent(),
    this.purpose = const Value.absent(),
    this.numberOfBirds = const Value.absent(),
    this.numberOfLayingHens = const Value.absent(),
    this.arrivalDate = const Value.absent(),
    this.hatchDate = const Value.absent(),
    this.housingType = const Value.absent(),
    this.source = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FlocksTableCompanion.insert({
    required String id,
    required String farmId,
    required String flockCode,
    required String name,
    required String breed,
    this.purpose = const Value.absent(),
    this.numberOfBirds = const Value.absent(),
    this.numberOfLayingHens = const Value.absent(),
    required DateTime arrivalDate,
    this.hatchDate = const Value.absent(),
    this.housingType = const Value.absent(),
    this.source = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       farmId = Value(farmId),
       flockCode = Value(flockCode),
       name = Value(name),
       breed = Value(breed),
       arrivalDate = Value(arrivalDate);
  static Insertable<LocalFlock> custom({
    Expression<String>? id,
    Expression<String>? farmId,
    Expression<String>? flockCode,
    Expression<String>? name,
    Expression<String>? breed,
    Expression<String>? purpose,
    Expression<int>? numberOfBirds,
    Expression<int>? numberOfLayingHens,
    Expression<DateTime>? arrivalDate,
    Expression<DateTime>? hatchDate,
    Expression<String>? housingType,
    Expression<String>? source,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<String>? createdBy,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (flockCode != null) 'flock_code': flockCode,
      if (name != null) 'name': name,
      if (breed != null) 'breed': breed,
      if (purpose != null) 'purpose': purpose,
      if (numberOfBirds != null) 'number_of_birds': numberOfBirds,
      if (numberOfLayingHens != null)
        'number_of_laying_hens': numberOfLayingHens,
      if (arrivalDate != null) 'arrival_date': arrivalDate,
      if (hatchDate != null) 'hatch_date': hatchDate,
      if (housingType != null) 'housing_type': housingType,
      if (source != null) 'source': source,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FlocksTableCompanion copyWith({
    Value<String>? id,
    Value<String>? farmId,
    Value<String>? flockCode,
    Value<String>? name,
    Value<String>? breed,
    Value<String>? purpose,
    Value<int>? numberOfBirds,
    Value<int>? numberOfLayingHens,
    Value<DateTime>? arrivalDate,
    Value<DateTime?>? hatchDate,
    Value<String?>? housingType,
    Value<String?>? source,
    Value<String>? status,
    Value<String?>? notes,
    Value<String?>? createdBy,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return FlocksTableCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      flockCode: flockCode ?? this.flockCode,
      name: name ?? this.name,
      breed: breed ?? this.breed,
      purpose: purpose ?? this.purpose,
      numberOfBirds: numberOfBirds ?? this.numberOfBirds,
      numberOfLayingHens: numberOfLayingHens ?? this.numberOfLayingHens,
      arrivalDate: arrivalDate ?? this.arrivalDate,
      hatchDate: hatchDate ?? this.hatchDate,
      housingType: housingType ?? this.housingType,
      source: source ?? this.source,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
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
    if (flockCode.present) {
      map['flock_code'] = Variable<String>(flockCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (purpose.present) {
      map['purpose'] = Variable<String>(purpose.value);
    }
    if (numberOfBirds.present) {
      map['number_of_birds'] = Variable<int>(numberOfBirds.value);
    }
    if (numberOfLayingHens.present) {
      map['number_of_laying_hens'] = Variable<int>(numberOfLayingHens.value);
    }
    if (arrivalDate.present) {
      map['arrival_date'] = Variable<DateTime>(arrivalDate.value);
    }
    if (hatchDate.present) {
      map['hatch_date'] = Variable<DateTime>(hatchDate.value);
    }
    if (housingType.present) {
      map['housing_type'] = Variable<String>(housingType.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlocksTableCompanion(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('flockCode: $flockCode, ')
          ..write('name: $name, ')
          ..write('breed: $breed, ')
          ..write('purpose: $purpose, ')
          ..write('numberOfBirds: $numberOfBirds, ')
          ..write('numberOfLayingHens: $numberOfLayingHens, ')
          ..write('arrivalDate: $arrivalDate, ')
          ..write('hatchDate: $hatchDate, ')
          ..write('housingType: $housingType, ')
          ..write('source: $source, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EggProductionRecordsTableTable extends EggProductionRecordsTable
    with TableInfo<$EggProductionRecordsTableTable, LocalEggProductionRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EggProductionRecordsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _flockIdMeta = const VerificationMeta(
    'flockId',
  );
  @override
  late final GeneratedColumn<String> flockId = GeneratedColumn<String>(
    'flock_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productionDateMeta = const VerificationMeta(
    'productionDate',
  );
  @override
  late final GeneratedColumn<DateTime> productionDate =
      GeneratedColumn<DateTime>(
        'production_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _goodEggsMeta = const VerificationMeta(
    'goodEggs',
  );
  @override
  late final GeneratedColumn<int> goodEggs = GeneratedColumn<int>(
    'good_eggs',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _crackedEggsMeta = const VerificationMeta(
    'crackedEggs',
  );
  @override
  late final GeneratedColumn<int> crackedEggs = GeneratedColumn<int>(
    'cracked_eggs',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _rejectedEggsMeta = const VerificationMeta(
    'rejectedEggs',
  );
  @override
  late final GeneratedColumn<int> rejectedEggs = GeneratedColumn<int>(
    'rejected_eggs',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _farmUseEggsMeta = const VerificationMeta(
    'farmUseEggs',
  );
  @override
  late final GeneratedColumn<int> farmUseEggs = GeneratedColumn<int>(
    'farm_use_eggs',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _soldDirectlyEggsMeta = const VerificationMeta(
    'soldDirectlyEggs',
  );
  @override
  late final GeneratedColumn<int> soldDirectlyEggs = GeneratedColumn<int>(
    'sold_directly_eggs',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _availableEggsMeta = const VerificationMeta(
    'availableEggs',
  );
  @override
  late final GeneratedColumn<int> availableEggs = GeneratedColumn<int>(
    'available_eggs',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _recordedByMeta = const VerificationMeta(
    'recordedBy',
  );
  @override
  late final GeneratedColumn<String> recordedBy = GeneratedColumn<String>(
    'recorded_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    farmId,
    flockId,
    productionDate,
    goodEggs,
    crackedEggs,
    rejectedEggs,
    farmUseEggs,
    soldDirectlyEggs,
    availableEggs,
    recordedBy,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'egg_production_records_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalEggProductionRecord> instance, {
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
    if (data.containsKey('flock_id')) {
      context.handle(
        _flockIdMeta,
        flockId.isAcceptableOrUnknown(data['flock_id']!, _flockIdMeta),
      );
    } else if (isInserting) {
      context.missing(_flockIdMeta);
    }
    if (data.containsKey('production_date')) {
      context.handle(
        _productionDateMeta,
        productionDate.isAcceptableOrUnknown(
          data['production_date']!,
          _productionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productionDateMeta);
    }
    if (data.containsKey('good_eggs')) {
      context.handle(
        _goodEggsMeta,
        goodEggs.isAcceptableOrUnknown(data['good_eggs']!, _goodEggsMeta),
      );
    }
    if (data.containsKey('cracked_eggs')) {
      context.handle(
        _crackedEggsMeta,
        crackedEggs.isAcceptableOrUnknown(
          data['cracked_eggs']!,
          _crackedEggsMeta,
        ),
      );
    }
    if (data.containsKey('rejected_eggs')) {
      context.handle(
        _rejectedEggsMeta,
        rejectedEggs.isAcceptableOrUnknown(
          data['rejected_eggs']!,
          _rejectedEggsMeta,
        ),
      );
    }
    if (data.containsKey('farm_use_eggs')) {
      context.handle(
        _farmUseEggsMeta,
        farmUseEggs.isAcceptableOrUnknown(
          data['farm_use_eggs']!,
          _farmUseEggsMeta,
        ),
      );
    }
    if (data.containsKey('sold_directly_eggs')) {
      context.handle(
        _soldDirectlyEggsMeta,
        soldDirectlyEggs.isAcceptableOrUnknown(
          data['sold_directly_eggs']!,
          _soldDirectlyEggsMeta,
        ),
      );
    }
    if (data.containsKey('available_eggs')) {
      context.handle(
        _availableEggsMeta,
        availableEggs.isAcceptableOrUnknown(
          data['available_eggs']!,
          _availableEggsMeta,
        ),
      );
    }
    if (data.containsKey('recorded_by')) {
      context.handle(
        _recordedByMeta,
        recordedBy.isAcceptableOrUnknown(data['recorded_by']!, _recordedByMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalEggProductionRecord map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalEggProductionRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      flockId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flock_id'],
      )!,
      productionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}production_date'],
      )!,
      goodEggs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}good_eggs'],
      )!,
      crackedEggs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cracked_eggs'],
      )!,
      rejectedEggs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rejected_eggs'],
      )!,
      farmUseEggs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}farm_use_eggs'],
      )!,
      soldDirectlyEggs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sold_directly_eggs'],
      )!,
      availableEggs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}available_eggs'],
      )!,
      recordedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
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
  $EggProductionRecordsTableTable createAlias(String alias) {
    return $EggProductionRecordsTableTable(attachedDatabase, alias);
  }
}

class LocalEggProductionRecord extends DataClass
    implements Insertable<LocalEggProductionRecord> {
  final String id;
  final String farmId;
  final String flockId;
  final DateTime productionDate;
  final int goodEggs;
  final int crackedEggs;
  final int rejectedEggs;
  final int farmUseEggs;
  final int soldDirectlyEggs;
  final int availableEggs;
  final String? recordedBy;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const LocalEggProductionRecord({
    required this.id,
    required this.farmId,
    required this.flockId,
    required this.productionDate,
    required this.goodEggs,
    required this.crackedEggs,
    required this.rejectedEggs,
    required this.farmUseEggs,
    required this.soldDirectlyEggs,
    required this.availableEggs,
    this.recordedBy,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['farm_id'] = Variable<String>(farmId);
    map['flock_id'] = Variable<String>(flockId);
    map['production_date'] = Variable<DateTime>(productionDate);
    map['good_eggs'] = Variable<int>(goodEggs);
    map['cracked_eggs'] = Variable<int>(crackedEggs);
    map['rejected_eggs'] = Variable<int>(rejectedEggs);
    map['farm_use_eggs'] = Variable<int>(farmUseEggs);
    map['sold_directly_eggs'] = Variable<int>(soldDirectlyEggs);
    map['available_eggs'] = Variable<int>(availableEggs);
    if (!nullToAbsent || recordedBy != null) {
      map['recorded_by'] = Variable<String>(recordedBy);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  EggProductionRecordsTableCompanion toCompanion(bool nullToAbsent) {
    return EggProductionRecordsTableCompanion(
      id: Value(id),
      farmId: Value(farmId),
      flockId: Value(flockId),
      productionDate: Value(productionDate),
      goodEggs: Value(goodEggs),
      crackedEggs: Value(crackedEggs),
      rejectedEggs: Value(rejectedEggs),
      farmUseEggs: Value(farmUseEggs),
      soldDirectlyEggs: Value(soldDirectlyEggs),
      availableEggs: Value(availableEggs),
      recordedBy: recordedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(recordedBy),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalEggProductionRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalEggProductionRecord(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      flockId: serializer.fromJson<String>(json['flockId']),
      productionDate: serializer.fromJson<DateTime>(json['productionDate']),
      goodEggs: serializer.fromJson<int>(json['goodEggs']),
      crackedEggs: serializer.fromJson<int>(json['crackedEggs']),
      rejectedEggs: serializer.fromJson<int>(json['rejectedEggs']),
      farmUseEggs: serializer.fromJson<int>(json['farmUseEggs']),
      soldDirectlyEggs: serializer.fromJson<int>(json['soldDirectlyEggs']),
      availableEggs: serializer.fromJson<int>(json['availableEggs']),
      recordedBy: serializer.fromJson<String?>(json['recordedBy']),
      notes: serializer.fromJson<String?>(json['notes']),
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
      'flockId': serializer.toJson<String>(flockId),
      'productionDate': serializer.toJson<DateTime>(productionDate),
      'goodEggs': serializer.toJson<int>(goodEggs),
      'crackedEggs': serializer.toJson<int>(crackedEggs),
      'rejectedEggs': serializer.toJson<int>(rejectedEggs),
      'farmUseEggs': serializer.toJson<int>(farmUseEggs),
      'soldDirectlyEggs': serializer.toJson<int>(soldDirectlyEggs),
      'availableEggs': serializer.toJson<int>(availableEggs),
      'recordedBy': serializer.toJson<String?>(recordedBy),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalEggProductionRecord copyWith({
    String? id,
    String? farmId,
    String? flockId,
    DateTime? productionDate,
    int? goodEggs,
    int? crackedEggs,
    int? rejectedEggs,
    int? farmUseEggs,
    int? soldDirectlyEggs,
    int? availableEggs,
    Value<String?> recordedBy = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => LocalEggProductionRecord(
    id: id ?? this.id,
    farmId: farmId ?? this.farmId,
    flockId: flockId ?? this.flockId,
    productionDate: productionDate ?? this.productionDate,
    goodEggs: goodEggs ?? this.goodEggs,
    crackedEggs: crackedEggs ?? this.crackedEggs,
    rejectedEggs: rejectedEggs ?? this.rejectedEggs,
    farmUseEggs: farmUseEggs ?? this.farmUseEggs,
    soldDirectlyEggs: soldDirectlyEggs ?? this.soldDirectlyEggs,
    availableEggs: availableEggs ?? this.availableEggs,
    recordedBy: recordedBy.present ? recordedBy.value : this.recordedBy,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LocalEggProductionRecord copyWithCompanion(
    EggProductionRecordsTableCompanion data,
  ) {
    return LocalEggProductionRecord(
      id: data.id.present ? data.id.value : this.id,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      flockId: data.flockId.present ? data.flockId.value : this.flockId,
      productionDate: data.productionDate.present
          ? data.productionDate.value
          : this.productionDate,
      goodEggs: data.goodEggs.present ? data.goodEggs.value : this.goodEggs,
      crackedEggs: data.crackedEggs.present
          ? data.crackedEggs.value
          : this.crackedEggs,
      rejectedEggs: data.rejectedEggs.present
          ? data.rejectedEggs.value
          : this.rejectedEggs,
      farmUseEggs: data.farmUseEggs.present
          ? data.farmUseEggs.value
          : this.farmUseEggs,
      soldDirectlyEggs: data.soldDirectlyEggs.present
          ? data.soldDirectlyEggs.value
          : this.soldDirectlyEggs,
      availableEggs: data.availableEggs.present
          ? data.availableEggs.value
          : this.availableEggs,
      recordedBy: data.recordedBy.present
          ? data.recordedBy.value
          : this.recordedBy,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalEggProductionRecord(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('flockId: $flockId, ')
          ..write('productionDate: $productionDate, ')
          ..write('goodEggs: $goodEggs, ')
          ..write('crackedEggs: $crackedEggs, ')
          ..write('rejectedEggs: $rejectedEggs, ')
          ..write('farmUseEggs: $farmUseEggs, ')
          ..write('soldDirectlyEggs: $soldDirectlyEggs, ')
          ..write('availableEggs: $availableEggs, ')
          ..write('recordedBy: $recordedBy, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    farmId,
    flockId,
    productionDate,
    goodEggs,
    crackedEggs,
    rejectedEggs,
    farmUseEggs,
    soldDirectlyEggs,
    availableEggs,
    recordedBy,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalEggProductionRecord &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.flockId == this.flockId &&
          other.productionDate == this.productionDate &&
          other.goodEggs == this.goodEggs &&
          other.crackedEggs == this.crackedEggs &&
          other.rejectedEggs == this.rejectedEggs &&
          other.farmUseEggs == this.farmUseEggs &&
          other.soldDirectlyEggs == this.soldDirectlyEggs &&
          other.availableEggs == this.availableEggs &&
          other.recordedBy == this.recordedBy &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EggProductionRecordsTableCompanion
    extends UpdateCompanion<LocalEggProductionRecord> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String> flockId;
  final Value<DateTime> productionDate;
  final Value<int> goodEggs;
  final Value<int> crackedEggs;
  final Value<int> rejectedEggs;
  final Value<int> farmUseEggs;
  final Value<int> soldDirectlyEggs;
  final Value<int> availableEggs;
  final Value<String?> recordedBy;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const EggProductionRecordsTableCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.flockId = const Value.absent(),
    this.productionDate = const Value.absent(),
    this.goodEggs = const Value.absent(),
    this.crackedEggs = const Value.absent(),
    this.rejectedEggs = const Value.absent(),
    this.farmUseEggs = const Value.absent(),
    this.soldDirectlyEggs = const Value.absent(),
    this.availableEggs = const Value.absent(),
    this.recordedBy = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EggProductionRecordsTableCompanion.insert({
    required String id,
    required String farmId,
    required String flockId,
    required DateTime productionDate,
    this.goodEggs = const Value.absent(),
    this.crackedEggs = const Value.absent(),
    this.rejectedEggs = const Value.absent(),
    this.farmUseEggs = const Value.absent(),
    this.soldDirectlyEggs = const Value.absent(),
    this.availableEggs = const Value.absent(),
    this.recordedBy = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       farmId = Value(farmId),
       flockId = Value(flockId),
       productionDate = Value(productionDate);
  static Insertable<LocalEggProductionRecord> custom({
    Expression<String>? id,
    Expression<String>? farmId,
    Expression<String>? flockId,
    Expression<DateTime>? productionDate,
    Expression<int>? goodEggs,
    Expression<int>? crackedEggs,
    Expression<int>? rejectedEggs,
    Expression<int>? farmUseEggs,
    Expression<int>? soldDirectlyEggs,
    Expression<int>? availableEggs,
    Expression<String>? recordedBy,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (flockId != null) 'flock_id': flockId,
      if (productionDate != null) 'production_date': productionDate,
      if (goodEggs != null) 'good_eggs': goodEggs,
      if (crackedEggs != null) 'cracked_eggs': crackedEggs,
      if (rejectedEggs != null) 'rejected_eggs': rejectedEggs,
      if (farmUseEggs != null) 'farm_use_eggs': farmUseEggs,
      if (soldDirectlyEggs != null) 'sold_directly_eggs': soldDirectlyEggs,
      if (availableEggs != null) 'available_eggs': availableEggs,
      if (recordedBy != null) 'recorded_by': recordedBy,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EggProductionRecordsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? farmId,
    Value<String>? flockId,
    Value<DateTime>? productionDate,
    Value<int>? goodEggs,
    Value<int>? crackedEggs,
    Value<int>? rejectedEggs,
    Value<int>? farmUseEggs,
    Value<int>? soldDirectlyEggs,
    Value<int>? availableEggs,
    Value<String?>? recordedBy,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return EggProductionRecordsTableCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      flockId: flockId ?? this.flockId,
      productionDate: productionDate ?? this.productionDate,
      goodEggs: goodEggs ?? this.goodEggs,
      crackedEggs: crackedEggs ?? this.crackedEggs,
      rejectedEggs: rejectedEggs ?? this.rejectedEggs,
      farmUseEggs: farmUseEggs ?? this.farmUseEggs,
      soldDirectlyEggs: soldDirectlyEggs ?? this.soldDirectlyEggs,
      availableEggs: availableEggs ?? this.availableEggs,
      recordedBy: recordedBy ?? this.recordedBy,
      notes: notes ?? this.notes,
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
    if (flockId.present) {
      map['flock_id'] = Variable<String>(flockId.value);
    }
    if (productionDate.present) {
      map['production_date'] = Variable<DateTime>(productionDate.value);
    }
    if (goodEggs.present) {
      map['good_eggs'] = Variable<int>(goodEggs.value);
    }
    if (crackedEggs.present) {
      map['cracked_eggs'] = Variable<int>(crackedEggs.value);
    }
    if (rejectedEggs.present) {
      map['rejected_eggs'] = Variable<int>(rejectedEggs.value);
    }
    if (farmUseEggs.present) {
      map['farm_use_eggs'] = Variable<int>(farmUseEggs.value);
    }
    if (soldDirectlyEggs.present) {
      map['sold_directly_eggs'] = Variable<int>(soldDirectlyEggs.value);
    }
    if (availableEggs.present) {
      map['available_eggs'] = Variable<int>(availableEggs.value);
    }
    if (recordedBy.present) {
      map['recorded_by'] = Variable<String>(recordedBy.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
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
    return (StringBuffer('EggProductionRecordsTableCompanion(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('flockId: $flockId, ')
          ..write('productionDate: $productionDate, ')
          ..write('goodEggs: $goodEggs, ')
          ..write('crackedEggs: $crackedEggs, ')
          ..write('rejectedEggs: $rejectedEggs, ')
          ..write('farmUseEggs: $farmUseEggs, ')
          ..write('soldDirectlyEggs: $soldDirectlyEggs, ')
          ..write('availableEggs: $availableEggs, ')
          ..write('recordedBy: $recordedBy, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FlockAdjustmentsTableTable extends FlockAdjustmentsTable
    with TableInfo<$FlockAdjustmentsTableTable, LocalFlockAdjustment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlockAdjustmentsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _flockIdMeta = const VerificationMeta(
    'flockId',
  );
  @override
  late final GeneratedColumn<String> flockId = GeneratedColumn<String>(
    'flock_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _adjustmentTypeMeta = const VerificationMeta(
    'adjustmentType',
  );
  @override
  late final GeneratedColumn<String> adjustmentType = GeneratedColumn<String>(
    'adjustment_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _birdsChangedMeta = const VerificationMeta(
    'birdsChanged',
  );
  @override
  late final GeneratedColumn<int> birdsChanged = GeneratedColumn<int>(
    'birds_changed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hensChangedMeta = const VerificationMeta(
    'hensChanged',
  );
  @override
  late final GeneratedColumn<int> hensChanged = GeneratedColumn<int>(
    'hens_changed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByMeta = const VerificationMeta(
    'recordedBy',
  );
  @override
  late final GeneratedColumn<String> recordedBy = GeneratedColumn<String>(
    'recorded_by',
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    farmId,
    flockId,
    adjustmentType,
    birdsChanged,
    hensChanged,
    reason,
    recordedAt,
    recordedBy,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flock_adjustments_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalFlockAdjustment> instance, {
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
    if (data.containsKey('flock_id')) {
      context.handle(
        _flockIdMeta,
        flockId.isAcceptableOrUnknown(data['flock_id']!, _flockIdMeta),
      );
    } else if (isInserting) {
      context.missing(_flockIdMeta);
    }
    if (data.containsKey('adjustment_type')) {
      context.handle(
        _adjustmentTypeMeta,
        adjustmentType.isAcceptableOrUnknown(
          data['adjustment_type']!,
          _adjustmentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_adjustmentTypeMeta);
    }
    if (data.containsKey('birds_changed')) {
      context.handle(
        _birdsChangedMeta,
        birdsChanged.isAcceptableOrUnknown(
          data['birds_changed']!,
          _birdsChangedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_birdsChangedMeta);
    }
    if (data.containsKey('hens_changed')) {
      context.handle(
        _hensChangedMeta,
        hensChanged.isAcceptableOrUnknown(
          data['hens_changed']!,
          _hensChangedMeta,
        ),
      );
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('recorded_by')) {
      context.handle(
        _recordedByMeta,
        recordedBy.isAcceptableOrUnknown(data['recorded_by']!, _recordedByMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalFlockAdjustment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalFlockAdjustment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      flockId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flock_id'],
      )!,
      adjustmentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}adjustment_type'],
      )!,
      birdsChanged: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}birds_changed'],
      )!,
      hensChanged: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hens_changed'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      recordedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FlockAdjustmentsTableTable createAlias(String alias) {
    return $FlockAdjustmentsTableTable(attachedDatabase, alias);
  }
}

class LocalFlockAdjustment extends DataClass
    implements Insertable<LocalFlockAdjustment> {
  final String id;
  final String farmId;
  final String flockId;
  final String adjustmentType;
  final int birdsChanged;
  final int hensChanged;
  final String? reason;
  final DateTime recordedAt;
  final String? recordedBy;
  final DateTime createdAt;
  const LocalFlockAdjustment({
    required this.id,
    required this.farmId,
    required this.flockId,
    required this.adjustmentType,
    required this.birdsChanged,
    required this.hensChanged,
    this.reason,
    required this.recordedAt,
    this.recordedBy,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['farm_id'] = Variable<String>(farmId);
    map['flock_id'] = Variable<String>(flockId);
    map['adjustment_type'] = Variable<String>(adjustmentType);
    map['birds_changed'] = Variable<int>(birdsChanged);
    map['hens_changed'] = Variable<int>(hensChanged);
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    if (!nullToAbsent || recordedBy != null) {
      map['recorded_by'] = Variable<String>(recordedBy);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FlockAdjustmentsTableCompanion toCompanion(bool nullToAbsent) {
    return FlockAdjustmentsTableCompanion(
      id: Value(id),
      farmId: Value(farmId),
      flockId: Value(flockId),
      adjustmentType: Value(adjustmentType),
      birdsChanged: Value(birdsChanged),
      hensChanged: Value(hensChanged),
      reason: reason == null && nullToAbsent
          ? const Value.absent()
          : Value(reason),
      recordedAt: Value(recordedAt),
      recordedBy: recordedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(recordedBy),
      createdAt: Value(createdAt),
    );
  }

  factory LocalFlockAdjustment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalFlockAdjustment(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      flockId: serializer.fromJson<String>(json['flockId']),
      adjustmentType: serializer.fromJson<String>(json['adjustmentType']),
      birdsChanged: serializer.fromJson<int>(json['birdsChanged']),
      hensChanged: serializer.fromJson<int>(json['hensChanged']),
      reason: serializer.fromJson<String?>(json['reason']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      recordedBy: serializer.fromJson<String?>(json['recordedBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'farmId': serializer.toJson<String>(farmId),
      'flockId': serializer.toJson<String>(flockId),
      'adjustmentType': serializer.toJson<String>(adjustmentType),
      'birdsChanged': serializer.toJson<int>(birdsChanged),
      'hensChanged': serializer.toJson<int>(hensChanged),
      'reason': serializer.toJson<String?>(reason),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'recordedBy': serializer.toJson<String?>(recordedBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalFlockAdjustment copyWith({
    String? id,
    String? farmId,
    String? flockId,
    String? adjustmentType,
    int? birdsChanged,
    int? hensChanged,
    Value<String?> reason = const Value.absent(),
    DateTime? recordedAt,
    Value<String?> recordedBy = const Value.absent(),
    DateTime? createdAt,
  }) => LocalFlockAdjustment(
    id: id ?? this.id,
    farmId: farmId ?? this.farmId,
    flockId: flockId ?? this.flockId,
    adjustmentType: adjustmentType ?? this.adjustmentType,
    birdsChanged: birdsChanged ?? this.birdsChanged,
    hensChanged: hensChanged ?? this.hensChanged,
    reason: reason.present ? reason.value : this.reason,
    recordedAt: recordedAt ?? this.recordedAt,
    recordedBy: recordedBy.present ? recordedBy.value : this.recordedBy,
    createdAt: createdAt ?? this.createdAt,
  );
  LocalFlockAdjustment copyWithCompanion(FlockAdjustmentsTableCompanion data) {
    return LocalFlockAdjustment(
      id: data.id.present ? data.id.value : this.id,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      flockId: data.flockId.present ? data.flockId.value : this.flockId,
      adjustmentType: data.adjustmentType.present
          ? data.adjustmentType.value
          : this.adjustmentType,
      birdsChanged: data.birdsChanged.present
          ? data.birdsChanged.value
          : this.birdsChanged,
      hensChanged: data.hensChanged.present
          ? data.hensChanged.value
          : this.hensChanged,
      reason: data.reason.present ? data.reason.value : this.reason,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      recordedBy: data.recordedBy.present
          ? data.recordedBy.value
          : this.recordedBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalFlockAdjustment(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('flockId: $flockId, ')
          ..write('adjustmentType: $adjustmentType, ')
          ..write('birdsChanged: $birdsChanged, ')
          ..write('hensChanged: $hensChanged, ')
          ..write('reason: $reason, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('recordedBy: $recordedBy, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    farmId,
    flockId,
    adjustmentType,
    birdsChanged,
    hensChanged,
    reason,
    recordedAt,
    recordedBy,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalFlockAdjustment &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.flockId == this.flockId &&
          other.adjustmentType == this.adjustmentType &&
          other.birdsChanged == this.birdsChanged &&
          other.hensChanged == this.hensChanged &&
          other.reason == this.reason &&
          other.recordedAt == this.recordedAt &&
          other.recordedBy == this.recordedBy &&
          other.createdAt == this.createdAt);
}

class FlockAdjustmentsTableCompanion
    extends UpdateCompanion<LocalFlockAdjustment> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String> flockId;
  final Value<String> adjustmentType;
  final Value<int> birdsChanged;
  final Value<int> hensChanged;
  final Value<String?> reason;
  final Value<DateTime> recordedAt;
  final Value<String?> recordedBy;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FlockAdjustmentsTableCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.flockId = const Value.absent(),
    this.adjustmentType = const Value.absent(),
    this.birdsChanged = const Value.absent(),
    this.hensChanged = const Value.absent(),
    this.reason = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.recordedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FlockAdjustmentsTableCompanion.insert({
    required String id,
    required String farmId,
    required String flockId,
    required String adjustmentType,
    required int birdsChanged,
    this.hensChanged = const Value.absent(),
    this.reason = const Value.absent(),
    required DateTime recordedAt,
    this.recordedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       farmId = Value(farmId),
       flockId = Value(flockId),
       adjustmentType = Value(adjustmentType),
       birdsChanged = Value(birdsChanged),
       recordedAt = Value(recordedAt);
  static Insertable<LocalFlockAdjustment> custom({
    Expression<String>? id,
    Expression<String>? farmId,
    Expression<String>? flockId,
    Expression<String>? adjustmentType,
    Expression<int>? birdsChanged,
    Expression<int>? hensChanged,
    Expression<String>? reason,
    Expression<DateTime>? recordedAt,
    Expression<String>? recordedBy,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (flockId != null) 'flock_id': flockId,
      if (adjustmentType != null) 'adjustment_type': adjustmentType,
      if (birdsChanged != null) 'birds_changed': birdsChanged,
      if (hensChanged != null) 'hens_changed': hensChanged,
      if (reason != null) 'reason': reason,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (recordedBy != null) 'recorded_by': recordedBy,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FlockAdjustmentsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? farmId,
    Value<String>? flockId,
    Value<String>? adjustmentType,
    Value<int>? birdsChanged,
    Value<int>? hensChanged,
    Value<String?>? reason,
    Value<DateTime>? recordedAt,
    Value<String?>? recordedBy,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FlockAdjustmentsTableCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      flockId: flockId ?? this.flockId,
      adjustmentType: adjustmentType ?? this.adjustmentType,
      birdsChanged: birdsChanged ?? this.birdsChanged,
      hensChanged: hensChanged ?? this.hensChanged,
      reason: reason ?? this.reason,
      recordedAt: recordedAt ?? this.recordedAt,
      recordedBy: recordedBy ?? this.recordedBy,
      createdAt: createdAt ?? this.createdAt,
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
    if (flockId.present) {
      map['flock_id'] = Variable<String>(flockId.value);
    }
    if (adjustmentType.present) {
      map['adjustment_type'] = Variable<String>(adjustmentType.value);
    }
    if (birdsChanged.present) {
      map['birds_changed'] = Variable<int>(birdsChanged.value);
    }
    if (hensChanged.present) {
      map['hens_changed'] = Variable<int>(hensChanged.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (recordedBy.present) {
      map['recorded_by'] = Variable<String>(recordedBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlockAdjustmentsTableCompanion(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('flockId: $flockId, ')
          ..write('adjustmentType: $adjustmentType, ')
          ..write('birdsChanged: $birdsChanged, ')
          ..write('hensChanged: $hensChanged, ')
          ..write('reason: $reason, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('recordedBy: $recordedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FarmMarketProfilesTableTable extends FarmMarketProfilesTable
    with TableInfo<$FarmMarketProfilesTableTable, LocalFarmMarketProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmMarketProfilesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _farmIdMeta = const VerificationMeta('farmId');
  @override
  late final GeneratedColumn<String> farmId = GeneratedColumn<String>(
    'farm_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publicFarmNameMeta = const VerificationMeta(
    'publicFarmName',
  );
  @override
  late final GeneratedColumn<String> publicFarmName = GeneratedColumn<String>(
    'public_farm_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publicDescriptionMeta = const VerificationMeta(
    'publicDescription',
  );
  @override
  late final GeneratedColumn<String> publicDescription =
      GeneratedColumn<String>(
        'public_description',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _publicPhoneMeta = const VerificationMeta(
    'publicPhone',
  );
  @override
  late final GeneratedColumn<String> publicPhone = GeneratedColumn<String>(
    'public_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publicEmailMeta = const VerificationMeta(
    'publicEmail',
  );
  @override
  late final GeneratedColumn<String> publicEmail = GeneratedColumn<String>(
    'public_email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _generalLocationMeta = const VerificationMeta(
    'generalLocation',
  );
  @override
  late final GeneratedColumn<String> generalLocation = GeneratedColumn<String>(
    'general_location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _marketplaceStatusMeta = const VerificationMeta(
    'marketplaceStatus',
  );
  @override
  late final GeneratedColumn<String> marketplaceStatus =
      GeneratedColumn<String>(
        'marketplace_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('draft'),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    farmId,
    publicFarmName,
    publicDescription,
    publicPhone,
    publicEmail,
    generalLocation,
    marketplaceStatus,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_market_profiles_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalFarmMarketProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('farm_id')) {
      context.handle(
        _farmIdMeta,
        farmId.isAcceptableOrUnknown(data['farm_id']!, _farmIdMeta),
      );
    } else if (isInserting) {
      context.missing(_farmIdMeta);
    }
    if (data.containsKey('public_farm_name')) {
      context.handle(
        _publicFarmNameMeta,
        publicFarmName.isAcceptableOrUnknown(
          data['public_farm_name']!,
          _publicFarmNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publicFarmNameMeta);
    }
    if (data.containsKey('public_description')) {
      context.handle(
        _publicDescriptionMeta,
        publicDescription.isAcceptableOrUnknown(
          data['public_description']!,
          _publicDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('public_phone')) {
      context.handle(
        _publicPhoneMeta,
        publicPhone.isAcceptableOrUnknown(
          data['public_phone']!,
          _publicPhoneMeta,
        ),
      );
    }
    if (data.containsKey('public_email')) {
      context.handle(
        _publicEmailMeta,
        publicEmail.isAcceptableOrUnknown(
          data['public_email']!,
          _publicEmailMeta,
        ),
      );
    }
    if (data.containsKey('general_location')) {
      context.handle(
        _generalLocationMeta,
        generalLocation.isAcceptableOrUnknown(
          data['general_location']!,
          _generalLocationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_generalLocationMeta);
    }
    if (data.containsKey('marketplace_status')) {
      context.handle(
        _marketplaceStatusMeta,
        marketplaceStatus.isAcceptableOrUnknown(
          data['marketplace_status']!,
          _marketplaceStatusMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {farmId};
  @override
  LocalFarmMarketProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalFarmMarketProfile(
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      publicFarmName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}public_farm_name'],
      )!,
      publicDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}public_description'],
      ),
      publicPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}public_phone'],
      ),
      publicEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}public_email'],
      ),
      generalLocation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}general_location'],
      )!,
      marketplaceStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marketplace_status'],
      )!,
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
  $FarmMarketProfilesTableTable createAlias(String alias) {
    return $FarmMarketProfilesTableTable(attachedDatabase, alias);
  }
}

class LocalFarmMarketProfile extends DataClass
    implements Insertable<LocalFarmMarketProfile> {
  final String farmId;
  final String publicFarmName;
  final String? publicDescription;
  final String? publicPhone;
  final String? publicEmail;
  final String generalLocation;
  final String marketplaceStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  const LocalFarmMarketProfile({
    required this.farmId,
    required this.publicFarmName,
    this.publicDescription,
    this.publicPhone,
    this.publicEmail,
    required this.generalLocation,
    required this.marketplaceStatus,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['farm_id'] = Variable<String>(farmId);
    map['public_farm_name'] = Variable<String>(publicFarmName);
    if (!nullToAbsent || publicDescription != null) {
      map['public_description'] = Variable<String>(publicDescription);
    }
    if (!nullToAbsent || publicPhone != null) {
      map['public_phone'] = Variable<String>(publicPhone);
    }
    if (!nullToAbsent || publicEmail != null) {
      map['public_email'] = Variable<String>(publicEmail);
    }
    map['general_location'] = Variable<String>(generalLocation);
    map['marketplace_status'] = Variable<String>(marketplaceStatus);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FarmMarketProfilesTableCompanion toCompanion(bool nullToAbsent) {
    return FarmMarketProfilesTableCompanion(
      farmId: Value(farmId),
      publicFarmName: Value(publicFarmName),
      publicDescription: publicDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(publicDescription),
      publicPhone: publicPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(publicPhone),
      publicEmail: publicEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(publicEmail),
      generalLocation: Value(generalLocation),
      marketplaceStatus: Value(marketplaceStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalFarmMarketProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalFarmMarketProfile(
      farmId: serializer.fromJson<String>(json['farmId']),
      publicFarmName: serializer.fromJson<String>(json['publicFarmName']),
      publicDescription: serializer.fromJson<String?>(
        json['publicDescription'],
      ),
      publicPhone: serializer.fromJson<String?>(json['publicPhone']),
      publicEmail: serializer.fromJson<String?>(json['publicEmail']),
      generalLocation: serializer.fromJson<String>(json['generalLocation']),
      marketplaceStatus: serializer.fromJson<String>(json['marketplaceStatus']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'farmId': serializer.toJson<String>(farmId),
      'publicFarmName': serializer.toJson<String>(publicFarmName),
      'publicDescription': serializer.toJson<String?>(publicDescription),
      'publicPhone': serializer.toJson<String?>(publicPhone),
      'publicEmail': serializer.toJson<String?>(publicEmail),
      'generalLocation': serializer.toJson<String>(generalLocation),
      'marketplaceStatus': serializer.toJson<String>(marketplaceStatus),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalFarmMarketProfile copyWith({
    String? farmId,
    String? publicFarmName,
    Value<String?> publicDescription = const Value.absent(),
    Value<String?> publicPhone = const Value.absent(),
    Value<String?> publicEmail = const Value.absent(),
    String? generalLocation,
    String? marketplaceStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => LocalFarmMarketProfile(
    farmId: farmId ?? this.farmId,
    publicFarmName: publicFarmName ?? this.publicFarmName,
    publicDescription: publicDescription.present
        ? publicDescription.value
        : this.publicDescription,
    publicPhone: publicPhone.present ? publicPhone.value : this.publicPhone,
    publicEmail: publicEmail.present ? publicEmail.value : this.publicEmail,
    generalLocation: generalLocation ?? this.generalLocation,
    marketplaceStatus: marketplaceStatus ?? this.marketplaceStatus,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LocalFarmMarketProfile copyWithCompanion(
    FarmMarketProfilesTableCompanion data,
  ) {
    return LocalFarmMarketProfile(
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      publicFarmName: data.publicFarmName.present
          ? data.publicFarmName.value
          : this.publicFarmName,
      publicDescription: data.publicDescription.present
          ? data.publicDescription.value
          : this.publicDescription,
      publicPhone: data.publicPhone.present
          ? data.publicPhone.value
          : this.publicPhone,
      publicEmail: data.publicEmail.present
          ? data.publicEmail.value
          : this.publicEmail,
      generalLocation: data.generalLocation.present
          ? data.generalLocation.value
          : this.generalLocation,
      marketplaceStatus: data.marketplaceStatus.present
          ? data.marketplaceStatus.value
          : this.marketplaceStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalFarmMarketProfile(')
          ..write('farmId: $farmId, ')
          ..write('publicFarmName: $publicFarmName, ')
          ..write('publicDescription: $publicDescription, ')
          ..write('publicPhone: $publicPhone, ')
          ..write('publicEmail: $publicEmail, ')
          ..write('generalLocation: $generalLocation, ')
          ..write('marketplaceStatus: $marketplaceStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    farmId,
    publicFarmName,
    publicDescription,
    publicPhone,
    publicEmail,
    generalLocation,
    marketplaceStatus,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalFarmMarketProfile &&
          other.farmId == this.farmId &&
          other.publicFarmName == this.publicFarmName &&
          other.publicDescription == this.publicDescription &&
          other.publicPhone == this.publicPhone &&
          other.publicEmail == this.publicEmail &&
          other.generalLocation == this.generalLocation &&
          other.marketplaceStatus == this.marketplaceStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FarmMarketProfilesTableCompanion
    extends UpdateCompanion<LocalFarmMarketProfile> {
  final Value<String> farmId;
  final Value<String> publicFarmName;
  final Value<String?> publicDescription;
  final Value<String?> publicPhone;
  final Value<String?> publicEmail;
  final Value<String> generalLocation;
  final Value<String> marketplaceStatus;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const FarmMarketProfilesTableCompanion({
    this.farmId = const Value.absent(),
    this.publicFarmName = const Value.absent(),
    this.publicDescription = const Value.absent(),
    this.publicPhone = const Value.absent(),
    this.publicEmail = const Value.absent(),
    this.generalLocation = const Value.absent(),
    this.marketplaceStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FarmMarketProfilesTableCompanion.insert({
    required String farmId,
    required String publicFarmName,
    this.publicDescription = const Value.absent(),
    this.publicPhone = const Value.absent(),
    this.publicEmail = const Value.absent(),
    required String generalLocation,
    this.marketplaceStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : farmId = Value(farmId),
       publicFarmName = Value(publicFarmName),
       generalLocation = Value(generalLocation);
  static Insertable<LocalFarmMarketProfile> custom({
    Expression<String>? farmId,
    Expression<String>? publicFarmName,
    Expression<String>? publicDescription,
    Expression<String>? publicPhone,
    Expression<String>? publicEmail,
    Expression<String>? generalLocation,
    Expression<String>? marketplaceStatus,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (farmId != null) 'farm_id': farmId,
      if (publicFarmName != null) 'public_farm_name': publicFarmName,
      if (publicDescription != null) 'public_description': publicDescription,
      if (publicPhone != null) 'public_phone': publicPhone,
      if (publicEmail != null) 'public_email': publicEmail,
      if (generalLocation != null) 'general_location': generalLocation,
      if (marketplaceStatus != null) 'marketplace_status': marketplaceStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FarmMarketProfilesTableCompanion copyWith({
    Value<String>? farmId,
    Value<String>? publicFarmName,
    Value<String?>? publicDescription,
    Value<String?>? publicPhone,
    Value<String?>? publicEmail,
    Value<String>? generalLocation,
    Value<String>? marketplaceStatus,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return FarmMarketProfilesTableCompanion(
      farmId: farmId ?? this.farmId,
      publicFarmName: publicFarmName ?? this.publicFarmName,
      publicDescription: publicDescription ?? this.publicDescription,
      publicPhone: publicPhone ?? this.publicPhone,
      publicEmail: publicEmail ?? this.publicEmail,
      generalLocation: generalLocation ?? this.generalLocation,
      marketplaceStatus: marketplaceStatus ?? this.marketplaceStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (farmId.present) {
      map['farm_id'] = Variable<String>(farmId.value);
    }
    if (publicFarmName.present) {
      map['public_farm_name'] = Variable<String>(publicFarmName.value);
    }
    if (publicDescription.present) {
      map['public_description'] = Variable<String>(publicDescription.value);
    }
    if (publicPhone.present) {
      map['public_phone'] = Variable<String>(publicPhone.value);
    }
    if (publicEmail.present) {
      map['public_email'] = Variable<String>(publicEmail.value);
    }
    if (generalLocation.present) {
      map['general_location'] = Variable<String>(generalLocation.value);
    }
    if (marketplaceStatus.present) {
      map['marketplace_status'] = Variable<String>(marketplaceStatus.value);
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
    return (StringBuffer('FarmMarketProfilesTableCompanion(')
          ..write('farmId: $farmId, ')
          ..write('publicFarmName: $publicFarmName, ')
          ..write('publicDescription: $publicDescription, ')
          ..write('publicPhone: $publicPhone, ')
          ..write('publicEmail: $publicEmail, ')
          ..write('generalLocation: $generalLocation, ')
          ..write('marketplaceStatus: $marketplaceStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MarketProductsTableTable extends MarketProductsTable
    with TableInfo<$MarketProductsTableTable, LocalMarketProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MarketProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productCodeMeta = const VerificationMeta(
    'productCode',
  );
  @override
  late final GeneratedColumn<String> productCode = GeneratedColumn<String>(
    'product_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameAmMeta = const VerificationMeta('nameAm');
  @override
  late final GeneratedColumn<String> nameAm = GeneratedColumn<String>(
    'name_am',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameOmMeta = const VerificationMeta('nameOm');
  @override
  late final GeneratedColumn<String> nameOm = GeneratedColumn<String>(
    'name_om',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baseInventoryUnitMeta = const VerificationMeta(
    'baseInventoryUnit',
  );
  @override
  late final GeneratedColumn<String> baseInventoryUnit =
      GeneratedColumn<String>(
        'base_inventory_unit',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    productCode,
    category,
    nameEn,
    nameAm,
    nameOm,
    baseInventoryUnit,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'market_products_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalMarketProduct> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_code')) {
      context.handle(
        _productCodeMeta,
        productCode.isAcceptableOrUnknown(
          data['product_code']!,
          _productCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productCodeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('name_am')) {
      context.handle(
        _nameAmMeta,
        nameAm.isAcceptableOrUnknown(data['name_am']!, _nameAmMeta),
      );
    } else if (isInserting) {
      context.missing(_nameAmMeta);
    }
    if (data.containsKey('name_om')) {
      context.handle(
        _nameOmMeta,
        nameOm.isAcceptableOrUnknown(data['name_om']!, _nameOmMeta),
      );
    } else if (isInserting) {
      context.missing(_nameOmMeta);
    }
    if (data.containsKey('base_inventory_unit')) {
      context.handle(
        _baseInventoryUnitMeta,
        baseInventoryUnit.isAcceptableOrUnknown(
          data['base_inventory_unit']!,
          _baseInventoryUnitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_baseInventoryUnitMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalMarketProduct map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalMarketProduct(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      productCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_code'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      )!,
      nameAm: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_am'],
      )!,
      nameOm: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_om'],
      )!,
      baseInventoryUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_inventory_unit'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $MarketProductsTableTable createAlias(String alias) {
    return $MarketProductsTableTable(attachedDatabase, alias);
  }
}

class LocalMarketProduct extends DataClass
    implements Insertable<LocalMarketProduct> {
  final String id;
  final String productCode;
  final String category;
  final String nameEn;
  final String nameAm;
  final String nameOm;
  final String baseInventoryUnit;
  final bool active;
  const LocalMarketProduct({
    required this.id,
    required this.productCode,
    required this.category,
    required this.nameEn,
    required this.nameAm,
    required this.nameOm,
    required this.baseInventoryUnit,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_code'] = Variable<String>(productCode);
    map['category'] = Variable<String>(category);
    map['name_en'] = Variable<String>(nameEn);
    map['name_am'] = Variable<String>(nameAm);
    map['name_om'] = Variable<String>(nameOm);
    map['base_inventory_unit'] = Variable<String>(baseInventoryUnit);
    map['active'] = Variable<bool>(active);
    return map;
  }

  MarketProductsTableCompanion toCompanion(bool nullToAbsent) {
    return MarketProductsTableCompanion(
      id: Value(id),
      productCode: Value(productCode),
      category: Value(category),
      nameEn: Value(nameEn),
      nameAm: Value(nameAm),
      nameOm: Value(nameOm),
      baseInventoryUnit: Value(baseInventoryUnit),
      active: Value(active),
    );
  }

  factory LocalMarketProduct.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalMarketProduct(
      id: serializer.fromJson<String>(json['id']),
      productCode: serializer.fromJson<String>(json['productCode']),
      category: serializer.fromJson<String>(json['category']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      nameAm: serializer.fromJson<String>(json['nameAm']),
      nameOm: serializer.fromJson<String>(json['nameOm']),
      baseInventoryUnit: serializer.fromJson<String>(json['baseInventoryUnit']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productCode': serializer.toJson<String>(productCode),
      'category': serializer.toJson<String>(category),
      'nameEn': serializer.toJson<String>(nameEn),
      'nameAm': serializer.toJson<String>(nameAm),
      'nameOm': serializer.toJson<String>(nameOm),
      'baseInventoryUnit': serializer.toJson<String>(baseInventoryUnit),
      'active': serializer.toJson<bool>(active),
    };
  }

  LocalMarketProduct copyWith({
    String? id,
    String? productCode,
    String? category,
    String? nameEn,
    String? nameAm,
    String? nameOm,
    String? baseInventoryUnit,
    bool? active,
  }) => LocalMarketProduct(
    id: id ?? this.id,
    productCode: productCode ?? this.productCode,
    category: category ?? this.category,
    nameEn: nameEn ?? this.nameEn,
    nameAm: nameAm ?? this.nameAm,
    nameOm: nameOm ?? this.nameOm,
    baseInventoryUnit: baseInventoryUnit ?? this.baseInventoryUnit,
    active: active ?? this.active,
  );
  LocalMarketProduct copyWithCompanion(MarketProductsTableCompanion data) {
    return LocalMarketProduct(
      id: data.id.present ? data.id.value : this.id,
      productCode: data.productCode.present
          ? data.productCode.value
          : this.productCode,
      category: data.category.present ? data.category.value : this.category,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      nameAm: data.nameAm.present ? data.nameAm.value : this.nameAm,
      nameOm: data.nameOm.present ? data.nameOm.value : this.nameOm,
      baseInventoryUnit: data.baseInventoryUnit.present
          ? data.baseInventoryUnit.value
          : this.baseInventoryUnit,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalMarketProduct(')
          ..write('id: $id, ')
          ..write('productCode: $productCode, ')
          ..write('category: $category, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameAm: $nameAm, ')
          ..write('nameOm: $nameOm, ')
          ..write('baseInventoryUnit: $baseInventoryUnit, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    productCode,
    category,
    nameEn,
    nameAm,
    nameOm,
    baseInventoryUnit,
    active,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalMarketProduct &&
          other.id == this.id &&
          other.productCode == this.productCode &&
          other.category == this.category &&
          other.nameEn == this.nameEn &&
          other.nameAm == this.nameAm &&
          other.nameOm == this.nameOm &&
          other.baseInventoryUnit == this.baseInventoryUnit &&
          other.active == this.active);
}

class MarketProductsTableCompanion extends UpdateCompanion<LocalMarketProduct> {
  final Value<String> id;
  final Value<String> productCode;
  final Value<String> category;
  final Value<String> nameEn;
  final Value<String> nameAm;
  final Value<String> nameOm;
  final Value<String> baseInventoryUnit;
  final Value<bool> active;
  final Value<int> rowid;
  const MarketProductsTableCompanion({
    this.id = const Value.absent(),
    this.productCode = const Value.absent(),
    this.category = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.nameAm = const Value.absent(),
    this.nameOm = const Value.absent(),
    this.baseInventoryUnit = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MarketProductsTableCompanion.insert({
    required String id,
    required String productCode,
    required String category,
    required String nameEn,
    required String nameAm,
    required String nameOm,
    required String baseInventoryUnit,
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       productCode = Value(productCode),
       category = Value(category),
       nameEn = Value(nameEn),
       nameAm = Value(nameAm),
       nameOm = Value(nameOm),
       baseInventoryUnit = Value(baseInventoryUnit);
  static Insertable<LocalMarketProduct> custom({
    Expression<String>? id,
    Expression<String>? productCode,
    Expression<String>? category,
    Expression<String>? nameEn,
    Expression<String>? nameAm,
    Expression<String>? nameOm,
    Expression<String>? baseInventoryUnit,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productCode != null) 'product_code': productCode,
      if (category != null) 'category': category,
      if (nameEn != null) 'name_en': nameEn,
      if (nameAm != null) 'name_am': nameAm,
      if (nameOm != null) 'name_om': nameOm,
      if (baseInventoryUnit != null) 'base_inventory_unit': baseInventoryUnit,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MarketProductsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? productCode,
    Value<String>? category,
    Value<String>? nameEn,
    Value<String>? nameAm,
    Value<String>? nameOm,
    Value<String>? baseInventoryUnit,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return MarketProductsTableCompanion(
      id: id ?? this.id,
      productCode: productCode ?? this.productCode,
      category: category ?? this.category,
      nameEn: nameEn ?? this.nameEn,
      nameAm: nameAm ?? this.nameAm,
      nameOm: nameOm ?? this.nameOm,
      baseInventoryUnit: baseInventoryUnit ?? this.baseInventoryUnit,
      active: active ?? this.active,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productCode.present) {
      map['product_code'] = Variable<String>(productCode.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (nameAm.present) {
      map['name_am'] = Variable<String>(nameAm.value);
    }
    if (nameOm.present) {
      map['name_om'] = Variable<String>(nameOm.value);
    }
    if (baseInventoryUnit.present) {
      map['base_inventory_unit'] = Variable<String>(baseInventoryUnit.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarketProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('productCode: $productCode, ')
          ..write('category: $category, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameAm: $nameAm, ')
          ..write('nameOm: $nameOm, ')
          ..write('baseInventoryUnit: $baseInventoryUnit, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InventoryBatchesTableTable extends InventoryBatchesTable
    with TableInfo<$InventoryBatchesTableTable, LocalInventoryBatch> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryBatchesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _batchCodeMeta = const VerificationMeta(
    'batchCode',
  );
  @override
  late final GeneratedColumn<String> batchCode = GeneratedColumn<String>(
    'batch_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _producedQuantityMeta = const VerificationMeta(
    'producedQuantity',
  );
  @override
  late final GeneratedColumn<double> producedQuantity = GeneratedColumn<double>(
    'produced_quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _approvedQuantityMeta = const VerificationMeta(
    'approvedQuantity',
  );
  @override
  late final GeneratedColumn<double> approvedQuantity = GeneratedColumn<double>(
    'approved_quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _availableQuantityMeta = const VerificationMeta(
    'availableQuantity',
  );
  @override
  late final GeneratedColumn<double> availableQuantity =
      GeneratedColumn<double>(
        'available_quantity',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _baseUnitMeta = const VerificationMeta(
    'baseUnit',
  );
  @override
  late final GeneratedColumn<String> baseUnit = GeneratedColumn<String>(
    'base_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _producedAtMeta = const VerificationMeta(
    'producedAt',
  );
  @override
  late final GeneratedColumn<DateTime> producedAt = GeneratedColumn<DateTime>(
    'produced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _qualityStatusMeta = const VerificationMeta(
    'qualityStatus',
  );
  @override
  late final GeneratedColumn<String> qualityStatus = GeneratedColumn<String>(
    'quality_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending_inspection'),
  );
  static const VerificationMeta _marketplaceStatusMeta = const VerificationMeta(
    'marketplaceStatus',
  );
  @override
  late final GeneratedColumn<String> marketplaceStatus =
      GeneratedColumn<String>(
        'marketplace_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('unlisted'),
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    farmId,
    productId,
    batchCode,
    sourceType,
    producedQuantity,
    approvedQuantity,
    availableQuantity,
    baseUnit,
    producedAt,
    expiresAt,
    qualityStatus,
    marketplaceStatus,
    version,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_batches_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalInventoryBatch> instance, {
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
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    }
    if (data.containsKey('batch_code')) {
      context.handle(
        _batchCodeMeta,
        batchCode.isAcceptableOrUnknown(data['batch_code']!, _batchCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_batchCodeMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('produced_quantity')) {
      context.handle(
        _producedQuantityMeta,
        producedQuantity.isAcceptableOrUnknown(
          data['produced_quantity']!,
          _producedQuantityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_producedQuantityMeta);
    }
    if (data.containsKey('approved_quantity')) {
      context.handle(
        _approvedQuantityMeta,
        approvedQuantity.isAcceptableOrUnknown(
          data['approved_quantity']!,
          _approvedQuantityMeta,
        ),
      );
    }
    if (data.containsKey('available_quantity')) {
      context.handle(
        _availableQuantityMeta,
        availableQuantity.isAcceptableOrUnknown(
          data['available_quantity']!,
          _availableQuantityMeta,
        ),
      );
    }
    if (data.containsKey('base_unit')) {
      context.handle(
        _baseUnitMeta,
        baseUnit.isAcceptableOrUnknown(data['base_unit']!, _baseUnitMeta),
      );
    } else if (isInserting) {
      context.missing(_baseUnitMeta);
    }
    if (data.containsKey('produced_at')) {
      context.handle(
        _producedAtMeta,
        producedAt.isAcceptableOrUnknown(data['produced_at']!, _producedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_producedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    }
    if (data.containsKey('quality_status')) {
      context.handle(
        _qualityStatusMeta,
        qualityStatus.isAcceptableOrUnknown(
          data['quality_status']!,
          _qualityStatusMeta,
        ),
      );
    }
    if (data.containsKey('marketplace_status')) {
      context.handle(
        _marketplaceStatusMeta,
        marketplaceStatus.isAcceptableOrUnknown(
          data['marketplace_status']!,
          _marketplaceStatusMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalInventoryBatch map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalInventoryBatch(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      ),
      batchCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_code'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      producedQuantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}produced_quantity'],
      )!,
      approvedQuantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}approved_quantity'],
      )!,
      availableQuantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}available_quantity'],
      )!,
      baseUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_unit'],
      )!,
      producedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}produced_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      ),
      qualityStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quality_status'],
      )!,
      marketplaceStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marketplace_status'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
    );
  }

  @override
  $InventoryBatchesTableTable createAlias(String alias) {
    return $InventoryBatchesTableTable(attachedDatabase, alias);
  }
}

class LocalInventoryBatch extends DataClass
    implements Insertable<LocalInventoryBatch> {
  final String id;
  final String farmId;
  final String? productId;
  final String batchCode;
  final String sourceType;
  final double producedQuantity;
  final double approvedQuantity;
  final double availableQuantity;
  final String baseUnit;
  final DateTime producedAt;
  final DateTime? expiresAt;
  final String qualityStatus;
  final String marketplaceStatus;
  final int version;
  const LocalInventoryBatch({
    required this.id,
    required this.farmId,
    this.productId,
    required this.batchCode,
    required this.sourceType,
    required this.producedQuantity,
    required this.approvedQuantity,
    required this.availableQuantity,
    required this.baseUnit,
    required this.producedAt,
    this.expiresAt,
    required this.qualityStatus,
    required this.marketplaceStatus,
    required this.version,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['farm_id'] = Variable<String>(farmId);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    map['batch_code'] = Variable<String>(batchCode);
    map['source_type'] = Variable<String>(sourceType);
    map['produced_quantity'] = Variable<double>(producedQuantity);
    map['approved_quantity'] = Variable<double>(approvedQuantity);
    map['available_quantity'] = Variable<double>(availableQuantity);
    map['base_unit'] = Variable<String>(baseUnit);
    map['produced_at'] = Variable<DateTime>(producedAt);
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    map['quality_status'] = Variable<String>(qualityStatus);
    map['marketplace_status'] = Variable<String>(marketplaceStatus);
    map['version'] = Variable<int>(version);
    return map;
  }

  InventoryBatchesTableCompanion toCompanion(bool nullToAbsent) {
    return InventoryBatchesTableCompanion(
      id: Value(id),
      farmId: Value(farmId),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      batchCode: Value(batchCode),
      sourceType: Value(sourceType),
      producedQuantity: Value(producedQuantity),
      approvedQuantity: Value(approvedQuantity),
      availableQuantity: Value(availableQuantity),
      baseUnit: Value(baseUnit),
      producedAt: Value(producedAt),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      qualityStatus: Value(qualityStatus),
      marketplaceStatus: Value(marketplaceStatus),
      version: Value(version),
    );
  }

  factory LocalInventoryBatch.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalInventoryBatch(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      productId: serializer.fromJson<String?>(json['productId']),
      batchCode: serializer.fromJson<String>(json['batchCode']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      producedQuantity: serializer.fromJson<double>(json['producedQuantity']),
      approvedQuantity: serializer.fromJson<double>(json['approvedQuantity']),
      availableQuantity: serializer.fromJson<double>(json['availableQuantity']),
      baseUnit: serializer.fromJson<String>(json['baseUnit']),
      producedAt: serializer.fromJson<DateTime>(json['producedAt']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
      qualityStatus: serializer.fromJson<String>(json['qualityStatus']),
      marketplaceStatus: serializer.fromJson<String>(json['marketplaceStatus']),
      version: serializer.fromJson<int>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'farmId': serializer.toJson<String>(farmId),
      'productId': serializer.toJson<String?>(productId),
      'batchCode': serializer.toJson<String>(batchCode),
      'sourceType': serializer.toJson<String>(sourceType),
      'producedQuantity': serializer.toJson<double>(producedQuantity),
      'approvedQuantity': serializer.toJson<double>(approvedQuantity),
      'availableQuantity': serializer.toJson<double>(availableQuantity),
      'baseUnit': serializer.toJson<String>(baseUnit),
      'producedAt': serializer.toJson<DateTime>(producedAt),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
      'qualityStatus': serializer.toJson<String>(qualityStatus),
      'marketplaceStatus': serializer.toJson<String>(marketplaceStatus),
      'version': serializer.toJson<int>(version),
    };
  }

  LocalInventoryBatch copyWith({
    String? id,
    String? farmId,
    Value<String?> productId = const Value.absent(),
    String? batchCode,
    String? sourceType,
    double? producedQuantity,
    double? approvedQuantity,
    double? availableQuantity,
    String? baseUnit,
    DateTime? producedAt,
    Value<DateTime?> expiresAt = const Value.absent(),
    String? qualityStatus,
    String? marketplaceStatus,
    int? version,
  }) => LocalInventoryBatch(
    id: id ?? this.id,
    farmId: farmId ?? this.farmId,
    productId: productId.present ? productId.value : this.productId,
    batchCode: batchCode ?? this.batchCode,
    sourceType: sourceType ?? this.sourceType,
    producedQuantity: producedQuantity ?? this.producedQuantity,
    approvedQuantity: approvedQuantity ?? this.approvedQuantity,
    availableQuantity: availableQuantity ?? this.availableQuantity,
    baseUnit: baseUnit ?? this.baseUnit,
    producedAt: producedAt ?? this.producedAt,
    expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
    qualityStatus: qualityStatus ?? this.qualityStatus,
    marketplaceStatus: marketplaceStatus ?? this.marketplaceStatus,
    version: version ?? this.version,
  );
  LocalInventoryBatch copyWithCompanion(InventoryBatchesTableCompanion data) {
    return LocalInventoryBatch(
      id: data.id.present ? data.id.value : this.id,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      productId: data.productId.present ? data.productId.value : this.productId,
      batchCode: data.batchCode.present ? data.batchCode.value : this.batchCode,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      producedQuantity: data.producedQuantity.present
          ? data.producedQuantity.value
          : this.producedQuantity,
      approvedQuantity: data.approvedQuantity.present
          ? data.approvedQuantity.value
          : this.approvedQuantity,
      availableQuantity: data.availableQuantity.present
          ? data.availableQuantity.value
          : this.availableQuantity,
      baseUnit: data.baseUnit.present ? data.baseUnit.value : this.baseUnit,
      producedAt: data.producedAt.present
          ? data.producedAt.value
          : this.producedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      qualityStatus: data.qualityStatus.present
          ? data.qualityStatus.value
          : this.qualityStatus,
      marketplaceStatus: data.marketplaceStatus.present
          ? data.marketplaceStatus.value
          : this.marketplaceStatus,
      version: data.version.present ? data.version.value : this.version,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalInventoryBatch(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('productId: $productId, ')
          ..write('batchCode: $batchCode, ')
          ..write('sourceType: $sourceType, ')
          ..write('producedQuantity: $producedQuantity, ')
          ..write('approvedQuantity: $approvedQuantity, ')
          ..write('availableQuantity: $availableQuantity, ')
          ..write('baseUnit: $baseUnit, ')
          ..write('producedAt: $producedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('qualityStatus: $qualityStatus, ')
          ..write('marketplaceStatus: $marketplaceStatus, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    farmId,
    productId,
    batchCode,
    sourceType,
    producedQuantity,
    approvedQuantity,
    availableQuantity,
    baseUnit,
    producedAt,
    expiresAt,
    qualityStatus,
    marketplaceStatus,
    version,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalInventoryBatch &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.productId == this.productId &&
          other.batchCode == this.batchCode &&
          other.sourceType == this.sourceType &&
          other.producedQuantity == this.producedQuantity &&
          other.approvedQuantity == this.approvedQuantity &&
          other.availableQuantity == this.availableQuantity &&
          other.baseUnit == this.baseUnit &&
          other.producedAt == this.producedAt &&
          other.expiresAt == this.expiresAt &&
          other.qualityStatus == this.qualityStatus &&
          other.marketplaceStatus == this.marketplaceStatus &&
          other.version == this.version);
}

class InventoryBatchesTableCompanion
    extends UpdateCompanion<LocalInventoryBatch> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String?> productId;
  final Value<String> batchCode;
  final Value<String> sourceType;
  final Value<double> producedQuantity;
  final Value<double> approvedQuantity;
  final Value<double> availableQuantity;
  final Value<String> baseUnit;
  final Value<DateTime> producedAt;
  final Value<DateTime?> expiresAt;
  final Value<String> qualityStatus;
  final Value<String> marketplaceStatus;
  final Value<int> version;
  final Value<int> rowid;
  const InventoryBatchesTableCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.productId = const Value.absent(),
    this.batchCode = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.producedQuantity = const Value.absent(),
    this.approvedQuantity = const Value.absent(),
    this.availableQuantity = const Value.absent(),
    this.baseUnit = const Value.absent(),
    this.producedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.qualityStatus = const Value.absent(),
    this.marketplaceStatus = const Value.absent(),
    this.version = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryBatchesTableCompanion.insert({
    required String id,
    required String farmId,
    this.productId = const Value.absent(),
    required String batchCode,
    required String sourceType,
    required double producedQuantity,
    this.approvedQuantity = const Value.absent(),
    this.availableQuantity = const Value.absent(),
    required String baseUnit,
    required DateTime producedAt,
    this.expiresAt = const Value.absent(),
    this.qualityStatus = const Value.absent(),
    this.marketplaceStatus = const Value.absent(),
    this.version = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       farmId = Value(farmId),
       batchCode = Value(batchCode),
       sourceType = Value(sourceType),
       producedQuantity = Value(producedQuantity),
       baseUnit = Value(baseUnit),
       producedAt = Value(producedAt);
  static Insertable<LocalInventoryBatch> custom({
    Expression<String>? id,
    Expression<String>? farmId,
    Expression<String>? productId,
    Expression<String>? batchCode,
    Expression<String>? sourceType,
    Expression<double>? producedQuantity,
    Expression<double>? approvedQuantity,
    Expression<double>? availableQuantity,
    Expression<String>? baseUnit,
    Expression<DateTime>? producedAt,
    Expression<DateTime>? expiresAt,
    Expression<String>? qualityStatus,
    Expression<String>? marketplaceStatus,
    Expression<int>? version,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (productId != null) 'product_id': productId,
      if (batchCode != null) 'batch_code': batchCode,
      if (sourceType != null) 'source_type': sourceType,
      if (producedQuantity != null) 'produced_quantity': producedQuantity,
      if (approvedQuantity != null) 'approved_quantity': approvedQuantity,
      if (availableQuantity != null) 'available_quantity': availableQuantity,
      if (baseUnit != null) 'base_unit': baseUnit,
      if (producedAt != null) 'produced_at': producedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (qualityStatus != null) 'quality_status': qualityStatus,
      if (marketplaceStatus != null) 'marketplace_status': marketplaceStatus,
      if (version != null) 'version': version,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryBatchesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? farmId,
    Value<String?>? productId,
    Value<String>? batchCode,
    Value<String>? sourceType,
    Value<double>? producedQuantity,
    Value<double>? approvedQuantity,
    Value<double>? availableQuantity,
    Value<String>? baseUnit,
    Value<DateTime>? producedAt,
    Value<DateTime?>? expiresAt,
    Value<String>? qualityStatus,
    Value<String>? marketplaceStatus,
    Value<int>? version,
    Value<int>? rowid,
  }) {
    return InventoryBatchesTableCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      productId: productId ?? this.productId,
      batchCode: batchCode ?? this.batchCode,
      sourceType: sourceType ?? this.sourceType,
      producedQuantity: producedQuantity ?? this.producedQuantity,
      approvedQuantity: approvedQuantity ?? this.approvedQuantity,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      baseUnit: baseUnit ?? this.baseUnit,
      producedAt: producedAt ?? this.producedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      qualityStatus: qualityStatus ?? this.qualityStatus,
      marketplaceStatus: marketplaceStatus ?? this.marketplaceStatus,
      version: version ?? this.version,
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
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (batchCode.present) {
      map['batch_code'] = Variable<String>(batchCode.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (producedQuantity.present) {
      map['produced_quantity'] = Variable<double>(producedQuantity.value);
    }
    if (approvedQuantity.present) {
      map['approved_quantity'] = Variable<double>(approvedQuantity.value);
    }
    if (availableQuantity.present) {
      map['available_quantity'] = Variable<double>(availableQuantity.value);
    }
    if (baseUnit.present) {
      map['base_unit'] = Variable<String>(baseUnit.value);
    }
    if (producedAt.present) {
      map['produced_at'] = Variable<DateTime>(producedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (qualityStatus.present) {
      map['quality_status'] = Variable<String>(qualityStatus.value);
    }
    if (marketplaceStatus.present) {
      map['marketplace_status'] = Variable<String>(marketplaceStatus.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryBatchesTableCompanion(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('productId: $productId, ')
          ..write('batchCode: $batchCode, ')
          ..write('sourceType: $sourceType, ')
          ..write('producedQuantity: $producedQuantity, ')
          ..write('approvedQuantity: $approvedQuantity, ')
          ..write('availableQuantity: $availableQuantity, ')
          ..write('baseUnit: $baseUnit, ')
          ..write('producedAt: $producedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('qualityStatus: $qualityStatus, ')
          ..write('marketplaceStatus: $marketplaceStatus, ')
          ..write('version: $version, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QualityChecksTableTable extends QualityChecksTable
    with TableInfo<$QualityChecksTableTable, LocalQualityCheck> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QualityChecksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checkTypeMeta = const VerificationMeta(
    'checkType',
  );
  @override
  late final GeneratedColumn<String> checkType = GeneratedColumn<String>(
    'check_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
    'result',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkedByMeta = const VerificationMeta(
    'checkedBy',
  );
  @override
  late final GeneratedColumn<String> checkedBy = GeneratedColumn<String>(
    'checked_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkedAtMeta = const VerificationMeta(
    'checkedAt',
  );
  @override
  late final GeneratedColumn<DateTime> checkedAt = GeneratedColumn<DateTime>(
    'checked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _approvalStatusMeta = const VerificationMeta(
    'approvalStatus',
  );
  @override
  late final GeneratedColumn<String> approvalStatus = GeneratedColumn<String>(
    'approval_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    batchId,
    checkType,
    result,
    notes,
    checkedBy,
    checkedAt,
    approvalStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quality_checks_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalQualityCheck> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    } else if (isInserting) {
      context.missing(_batchIdMeta);
    }
    if (data.containsKey('check_type')) {
      context.handle(
        _checkTypeMeta,
        checkType.isAcceptableOrUnknown(data['check_type']!, _checkTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_checkTypeMeta);
    }
    if (data.containsKey('result')) {
      context.handle(
        _resultMeta,
        result.isAcceptableOrUnknown(data['result']!, _resultMeta),
      );
    } else if (isInserting) {
      context.missing(_resultMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('checked_by')) {
      context.handle(
        _checkedByMeta,
        checkedBy.isAcceptableOrUnknown(data['checked_by']!, _checkedByMeta),
      );
    }
    if (data.containsKey('checked_at')) {
      context.handle(
        _checkedAtMeta,
        checkedAt.isAcceptableOrUnknown(data['checked_at']!, _checkedAtMeta),
      );
    }
    if (data.containsKey('approval_status')) {
      context.handle(
        _approvalStatusMeta,
        approvalStatus.isAcceptableOrUnknown(
          data['approval_status']!,
          _approvalStatusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalQualityCheck map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalQualityCheck(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      )!,
      checkType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}check_type'],
      )!,
      result: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      checkedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checked_by'],
      ),
      checkedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}checked_at'],
      )!,
      approvalStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}approval_status'],
      )!,
    );
  }

  @override
  $QualityChecksTableTable createAlias(String alias) {
    return $QualityChecksTableTable(attachedDatabase, alias);
  }
}

class LocalQualityCheck extends DataClass
    implements Insertable<LocalQualityCheck> {
  final String id;
  final String batchId;
  final String checkType;
  final String result;
  final String? notes;
  final String? checkedBy;
  final DateTime checkedAt;
  final String approvalStatus;
  const LocalQualityCheck({
    required this.id,
    required this.batchId,
    required this.checkType,
    required this.result,
    this.notes,
    this.checkedBy,
    required this.checkedAt,
    required this.approvalStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['batch_id'] = Variable<String>(batchId);
    map['check_type'] = Variable<String>(checkType);
    map['result'] = Variable<String>(result);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || checkedBy != null) {
      map['checked_by'] = Variable<String>(checkedBy);
    }
    map['checked_at'] = Variable<DateTime>(checkedAt);
    map['approval_status'] = Variable<String>(approvalStatus);
    return map;
  }

  QualityChecksTableCompanion toCompanion(bool nullToAbsent) {
    return QualityChecksTableCompanion(
      id: Value(id),
      batchId: Value(batchId),
      checkType: Value(checkType),
      result: Value(result),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      checkedBy: checkedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(checkedBy),
      checkedAt: Value(checkedAt),
      approvalStatus: Value(approvalStatus),
    );
  }

  factory LocalQualityCheck.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalQualityCheck(
      id: serializer.fromJson<String>(json['id']),
      batchId: serializer.fromJson<String>(json['batchId']),
      checkType: serializer.fromJson<String>(json['checkType']),
      result: serializer.fromJson<String>(json['result']),
      notes: serializer.fromJson<String?>(json['notes']),
      checkedBy: serializer.fromJson<String?>(json['checkedBy']),
      checkedAt: serializer.fromJson<DateTime>(json['checkedAt']),
      approvalStatus: serializer.fromJson<String>(json['approvalStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batchId': serializer.toJson<String>(batchId),
      'checkType': serializer.toJson<String>(checkType),
      'result': serializer.toJson<String>(result),
      'notes': serializer.toJson<String?>(notes),
      'checkedBy': serializer.toJson<String?>(checkedBy),
      'checkedAt': serializer.toJson<DateTime>(checkedAt),
      'approvalStatus': serializer.toJson<String>(approvalStatus),
    };
  }

  LocalQualityCheck copyWith({
    String? id,
    String? batchId,
    String? checkType,
    String? result,
    Value<String?> notes = const Value.absent(),
    Value<String?> checkedBy = const Value.absent(),
    DateTime? checkedAt,
    String? approvalStatus,
  }) => LocalQualityCheck(
    id: id ?? this.id,
    batchId: batchId ?? this.batchId,
    checkType: checkType ?? this.checkType,
    result: result ?? this.result,
    notes: notes.present ? notes.value : this.notes,
    checkedBy: checkedBy.present ? checkedBy.value : this.checkedBy,
    checkedAt: checkedAt ?? this.checkedAt,
    approvalStatus: approvalStatus ?? this.approvalStatus,
  );
  LocalQualityCheck copyWithCompanion(QualityChecksTableCompanion data) {
    return LocalQualityCheck(
      id: data.id.present ? data.id.value : this.id,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      checkType: data.checkType.present ? data.checkType.value : this.checkType,
      result: data.result.present ? data.result.value : this.result,
      notes: data.notes.present ? data.notes.value : this.notes,
      checkedBy: data.checkedBy.present ? data.checkedBy.value : this.checkedBy,
      checkedAt: data.checkedAt.present ? data.checkedAt.value : this.checkedAt,
      approvalStatus: data.approvalStatus.present
          ? data.approvalStatus.value
          : this.approvalStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalQualityCheck(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('checkType: $checkType, ')
          ..write('result: $result, ')
          ..write('notes: $notes, ')
          ..write('checkedBy: $checkedBy, ')
          ..write('checkedAt: $checkedAt, ')
          ..write('approvalStatus: $approvalStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    batchId,
    checkType,
    result,
    notes,
    checkedBy,
    checkedAt,
    approvalStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalQualityCheck &&
          other.id == this.id &&
          other.batchId == this.batchId &&
          other.checkType == this.checkType &&
          other.result == this.result &&
          other.notes == this.notes &&
          other.checkedBy == this.checkedBy &&
          other.checkedAt == this.checkedAt &&
          other.approvalStatus == this.approvalStatus);
}

class QualityChecksTableCompanion extends UpdateCompanion<LocalQualityCheck> {
  final Value<String> id;
  final Value<String> batchId;
  final Value<String> checkType;
  final Value<String> result;
  final Value<String?> notes;
  final Value<String?> checkedBy;
  final Value<DateTime> checkedAt;
  final Value<String> approvalStatus;
  final Value<int> rowid;
  const QualityChecksTableCompanion({
    this.id = const Value.absent(),
    this.batchId = const Value.absent(),
    this.checkType = const Value.absent(),
    this.result = const Value.absent(),
    this.notes = const Value.absent(),
    this.checkedBy = const Value.absent(),
    this.checkedAt = const Value.absent(),
    this.approvalStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QualityChecksTableCompanion.insert({
    required String id,
    required String batchId,
    required String checkType,
    required String result,
    this.notes = const Value.absent(),
    this.checkedBy = const Value.absent(),
    this.checkedAt = const Value.absent(),
    this.approvalStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       batchId = Value(batchId),
       checkType = Value(checkType),
       result = Value(result);
  static Insertable<LocalQualityCheck> custom({
    Expression<String>? id,
    Expression<String>? batchId,
    Expression<String>? checkType,
    Expression<String>? result,
    Expression<String>? notes,
    Expression<String>? checkedBy,
    Expression<DateTime>? checkedAt,
    Expression<String>? approvalStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchId != null) 'batch_id': batchId,
      if (checkType != null) 'check_type': checkType,
      if (result != null) 'result': result,
      if (notes != null) 'notes': notes,
      if (checkedBy != null) 'checked_by': checkedBy,
      if (checkedAt != null) 'checked_at': checkedAt,
      if (approvalStatus != null) 'approval_status': approvalStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QualityChecksTableCompanion copyWith({
    Value<String>? id,
    Value<String>? batchId,
    Value<String>? checkType,
    Value<String>? result,
    Value<String?>? notes,
    Value<String?>? checkedBy,
    Value<DateTime>? checkedAt,
    Value<String>? approvalStatus,
    Value<int>? rowid,
  }) {
    return QualityChecksTableCompanion(
      id: id ?? this.id,
      batchId: batchId ?? this.batchId,
      checkType: checkType ?? this.checkType,
      result: result ?? this.result,
      notes: notes ?? this.notes,
      checkedBy: checkedBy ?? this.checkedBy,
      checkedAt: checkedAt ?? this.checkedAt,
      approvalStatus: approvalStatus ?? this.approvalStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (checkType.present) {
      map['check_type'] = Variable<String>(checkType.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (checkedBy.present) {
      map['checked_by'] = Variable<String>(checkedBy.value);
    }
    if (checkedAt.present) {
      map['checked_at'] = Variable<DateTime>(checkedAt.value);
    }
    if (approvalStatus.present) {
      map['approval_status'] = Variable<String>(approvalStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QualityChecksTableCompanion(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('checkType: $checkType, ')
          ..write('result: $result, ')
          ..write('notes: $notes, ')
          ..write('checkedBy: $checkedBy, ')
          ..write('checkedAt: $checkedAt, ')
          ..write('approvalStatus: $approvalStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MarketListingsTableTable extends MarketListingsTable
    with TableInfo<$MarketListingsTableTable, LocalMarketListing> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MarketListingsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publicTitleMeta = const VerificationMeta(
    'publicTitle',
  );
  @override
  late final GeneratedColumn<String> publicTitle = GeneratedColumn<String>(
    'public_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publicDescriptionMeta = const VerificationMeta(
    'publicDescription',
  );
  @override
  late final GeneratedColumn<String> publicDescription =
      GeneratedColumn<String>(
        'public_description',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _sellingUnitMeta = const VerificationMeta(
    'sellingUnit',
  );
  @override
  late final GeneratedColumn<String> sellingUnit = GeneratedColumn<String>(
    'selling_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitConversionMeta = const VerificationMeta(
    'unitConversion',
  );
  @override
  late final GeneratedColumn<int> unitConversion = GeneratedColumn<int>(
    'unit_conversion',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _priceInMinorUnitsMeta = const VerificationMeta(
    'priceInMinorUnits',
  );
  @override
  late final GeneratedColumn<int> priceInMinorUnits = GeneratedColumn<int>(
    'price_in_minor_units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('ETB'),
  );
  static const VerificationMeta _minimumOrderQuantityMeta =
      const VerificationMeta('minimumOrderQuantity');
  @override
  late final GeneratedColumn<int> minimumOrderQuantity = GeneratedColumn<int>(
    'minimum_order_quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _approvalStatusMeta = const VerificationMeta(
    'approvalStatus',
  );
  @override
  late final GeneratedColumn<String> approvalStatus = GeneratedColumn<String>(
    'approval_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    farmId,
    productId,
    publicTitle,
    publicDescription,
    sellingUnit,
    unitConversion,
    priceInMinorUnits,
    currency,
    minimumOrderQuantity,
    status,
    approvalStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'market_listings_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalMarketListing> instance, {
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
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    }
    if (data.containsKey('public_title')) {
      context.handle(
        _publicTitleMeta,
        publicTitle.isAcceptableOrUnknown(
          data['public_title']!,
          _publicTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publicTitleMeta);
    }
    if (data.containsKey('public_description')) {
      context.handle(
        _publicDescriptionMeta,
        publicDescription.isAcceptableOrUnknown(
          data['public_description']!,
          _publicDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('selling_unit')) {
      context.handle(
        _sellingUnitMeta,
        sellingUnit.isAcceptableOrUnknown(
          data['selling_unit']!,
          _sellingUnitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sellingUnitMeta);
    }
    if (data.containsKey('unit_conversion')) {
      context.handle(
        _unitConversionMeta,
        unitConversion.isAcceptableOrUnknown(
          data['unit_conversion']!,
          _unitConversionMeta,
        ),
      );
    }
    if (data.containsKey('price_in_minor_units')) {
      context.handle(
        _priceInMinorUnitsMeta,
        priceInMinorUnits.isAcceptableOrUnknown(
          data['price_in_minor_units']!,
          _priceInMinorUnitsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_priceInMinorUnitsMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('minimum_order_quantity')) {
      context.handle(
        _minimumOrderQuantityMeta,
        minimumOrderQuantity.isAcceptableOrUnknown(
          data['minimum_order_quantity']!,
          _minimumOrderQuantityMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('approval_status')) {
      context.handle(
        _approvalStatusMeta,
        approvalStatus.isAcceptableOrUnknown(
          data['approval_status']!,
          _approvalStatusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalMarketListing map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalMarketListing(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      ),
      publicTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}public_title'],
      )!,
      publicDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}public_description'],
      ),
      sellingUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selling_unit'],
      )!,
      unitConversion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_conversion'],
      )!,
      priceInMinorUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price_in_minor_units'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      minimumOrderQuantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minimum_order_quantity'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      approvalStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}approval_status'],
      )!,
    );
  }

  @override
  $MarketListingsTableTable createAlias(String alias) {
    return $MarketListingsTableTable(attachedDatabase, alias);
  }
}

class LocalMarketListing extends DataClass
    implements Insertable<LocalMarketListing> {
  final String id;
  final String farmId;
  final String? productId;
  final String publicTitle;
  final String? publicDescription;
  final String sellingUnit;
  final int unitConversion;
  final int priceInMinorUnits;
  final String currency;
  final int minimumOrderQuantity;
  final String status;
  final String approvalStatus;
  const LocalMarketListing({
    required this.id,
    required this.farmId,
    this.productId,
    required this.publicTitle,
    this.publicDescription,
    required this.sellingUnit,
    required this.unitConversion,
    required this.priceInMinorUnits,
    required this.currency,
    required this.minimumOrderQuantity,
    required this.status,
    required this.approvalStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['farm_id'] = Variable<String>(farmId);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    map['public_title'] = Variable<String>(publicTitle);
    if (!nullToAbsent || publicDescription != null) {
      map['public_description'] = Variable<String>(publicDescription);
    }
    map['selling_unit'] = Variable<String>(sellingUnit);
    map['unit_conversion'] = Variable<int>(unitConversion);
    map['price_in_minor_units'] = Variable<int>(priceInMinorUnits);
    map['currency'] = Variable<String>(currency);
    map['minimum_order_quantity'] = Variable<int>(minimumOrderQuantity);
    map['status'] = Variable<String>(status);
    map['approval_status'] = Variable<String>(approvalStatus);
    return map;
  }

  MarketListingsTableCompanion toCompanion(bool nullToAbsent) {
    return MarketListingsTableCompanion(
      id: Value(id),
      farmId: Value(farmId),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      publicTitle: Value(publicTitle),
      publicDescription: publicDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(publicDescription),
      sellingUnit: Value(sellingUnit),
      unitConversion: Value(unitConversion),
      priceInMinorUnits: Value(priceInMinorUnits),
      currency: Value(currency),
      minimumOrderQuantity: Value(minimumOrderQuantity),
      status: Value(status),
      approvalStatus: Value(approvalStatus),
    );
  }

  factory LocalMarketListing.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalMarketListing(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      productId: serializer.fromJson<String?>(json['productId']),
      publicTitle: serializer.fromJson<String>(json['publicTitle']),
      publicDescription: serializer.fromJson<String?>(
        json['publicDescription'],
      ),
      sellingUnit: serializer.fromJson<String>(json['sellingUnit']),
      unitConversion: serializer.fromJson<int>(json['unitConversion']),
      priceInMinorUnits: serializer.fromJson<int>(json['priceInMinorUnits']),
      currency: serializer.fromJson<String>(json['currency']),
      minimumOrderQuantity: serializer.fromJson<int>(
        json['minimumOrderQuantity'],
      ),
      status: serializer.fromJson<String>(json['status']),
      approvalStatus: serializer.fromJson<String>(json['approvalStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'farmId': serializer.toJson<String>(farmId),
      'productId': serializer.toJson<String?>(productId),
      'publicTitle': serializer.toJson<String>(publicTitle),
      'publicDescription': serializer.toJson<String?>(publicDescription),
      'sellingUnit': serializer.toJson<String>(sellingUnit),
      'unitConversion': serializer.toJson<int>(unitConversion),
      'priceInMinorUnits': serializer.toJson<int>(priceInMinorUnits),
      'currency': serializer.toJson<String>(currency),
      'minimumOrderQuantity': serializer.toJson<int>(minimumOrderQuantity),
      'status': serializer.toJson<String>(status),
      'approvalStatus': serializer.toJson<String>(approvalStatus),
    };
  }

  LocalMarketListing copyWith({
    String? id,
    String? farmId,
    Value<String?> productId = const Value.absent(),
    String? publicTitle,
    Value<String?> publicDescription = const Value.absent(),
    String? sellingUnit,
    int? unitConversion,
    int? priceInMinorUnits,
    String? currency,
    int? minimumOrderQuantity,
    String? status,
    String? approvalStatus,
  }) => LocalMarketListing(
    id: id ?? this.id,
    farmId: farmId ?? this.farmId,
    productId: productId.present ? productId.value : this.productId,
    publicTitle: publicTitle ?? this.publicTitle,
    publicDescription: publicDescription.present
        ? publicDescription.value
        : this.publicDescription,
    sellingUnit: sellingUnit ?? this.sellingUnit,
    unitConversion: unitConversion ?? this.unitConversion,
    priceInMinorUnits: priceInMinorUnits ?? this.priceInMinorUnits,
    currency: currency ?? this.currency,
    minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
    status: status ?? this.status,
    approvalStatus: approvalStatus ?? this.approvalStatus,
  );
  LocalMarketListing copyWithCompanion(MarketListingsTableCompanion data) {
    return LocalMarketListing(
      id: data.id.present ? data.id.value : this.id,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      productId: data.productId.present ? data.productId.value : this.productId,
      publicTitle: data.publicTitle.present
          ? data.publicTitle.value
          : this.publicTitle,
      publicDescription: data.publicDescription.present
          ? data.publicDescription.value
          : this.publicDescription,
      sellingUnit: data.sellingUnit.present
          ? data.sellingUnit.value
          : this.sellingUnit,
      unitConversion: data.unitConversion.present
          ? data.unitConversion.value
          : this.unitConversion,
      priceInMinorUnits: data.priceInMinorUnits.present
          ? data.priceInMinorUnits.value
          : this.priceInMinorUnits,
      currency: data.currency.present ? data.currency.value : this.currency,
      minimumOrderQuantity: data.minimumOrderQuantity.present
          ? data.minimumOrderQuantity.value
          : this.minimumOrderQuantity,
      status: data.status.present ? data.status.value : this.status,
      approvalStatus: data.approvalStatus.present
          ? data.approvalStatus.value
          : this.approvalStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalMarketListing(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('productId: $productId, ')
          ..write('publicTitle: $publicTitle, ')
          ..write('publicDescription: $publicDescription, ')
          ..write('sellingUnit: $sellingUnit, ')
          ..write('unitConversion: $unitConversion, ')
          ..write('priceInMinorUnits: $priceInMinorUnits, ')
          ..write('currency: $currency, ')
          ..write('minimumOrderQuantity: $minimumOrderQuantity, ')
          ..write('status: $status, ')
          ..write('approvalStatus: $approvalStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    farmId,
    productId,
    publicTitle,
    publicDescription,
    sellingUnit,
    unitConversion,
    priceInMinorUnits,
    currency,
    minimumOrderQuantity,
    status,
    approvalStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalMarketListing &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.productId == this.productId &&
          other.publicTitle == this.publicTitle &&
          other.publicDescription == this.publicDescription &&
          other.sellingUnit == this.sellingUnit &&
          other.unitConversion == this.unitConversion &&
          other.priceInMinorUnits == this.priceInMinorUnits &&
          other.currency == this.currency &&
          other.minimumOrderQuantity == this.minimumOrderQuantity &&
          other.status == this.status &&
          other.approvalStatus == this.approvalStatus);
}

class MarketListingsTableCompanion extends UpdateCompanion<LocalMarketListing> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String?> productId;
  final Value<String> publicTitle;
  final Value<String?> publicDescription;
  final Value<String> sellingUnit;
  final Value<int> unitConversion;
  final Value<int> priceInMinorUnits;
  final Value<String> currency;
  final Value<int> minimumOrderQuantity;
  final Value<String> status;
  final Value<String> approvalStatus;
  final Value<int> rowid;
  const MarketListingsTableCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.productId = const Value.absent(),
    this.publicTitle = const Value.absent(),
    this.publicDescription = const Value.absent(),
    this.sellingUnit = const Value.absent(),
    this.unitConversion = const Value.absent(),
    this.priceInMinorUnits = const Value.absent(),
    this.currency = const Value.absent(),
    this.minimumOrderQuantity = const Value.absent(),
    this.status = const Value.absent(),
    this.approvalStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MarketListingsTableCompanion.insert({
    required String id,
    required String farmId,
    this.productId = const Value.absent(),
    required String publicTitle,
    this.publicDescription = const Value.absent(),
    required String sellingUnit,
    this.unitConversion = const Value.absent(),
    required int priceInMinorUnits,
    this.currency = const Value.absent(),
    this.minimumOrderQuantity = const Value.absent(),
    this.status = const Value.absent(),
    this.approvalStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       farmId = Value(farmId),
       publicTitle = Value(publicTitle),
       sellingUnit = Value(sellingUnit),
       priceInMinorUnits = Value(priceInMinorUnits);
  static Insertable<LocalMarketListing> custom({
    Expression<String>? id,
    Expression<String>? farmId,
    Expression<String>? productId,
    Expression<String>? publicTitle,
    Expression<String>? publicDescription,
    Expression<String>? sellingUnit,
    Expression<int>? unitConversion,
    Expression<int>? priceInMinorUnits,
    Expression<String>? currency,
    Expression<int>? minimumOrderQuantity,
    Expression<String>? status,
    Expression<String>? approvalStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (productId != null) 'product_id': productId,
      if (publicTitle != null) 'public_title': publicTitle,
      if (publicDescription != null) 'public_description': publicDescription,
      if (sellingUnit != null) 'selling_unit': sellingUnit,
      if (unitConversion != null) 'unit_conversion': unitConversion,
      if (priceInMinorUnits != null) 'price_in_minor_units': priceInMinorUnits,
      if (currency != null) 'currency': currency,
      if (minimumOrderQuantity != null)
        'minimum_order_quantity': minimumOrderQuantity,
      if (status != null) 'status': status,
      if (approvalStatus != null) 'approval_status': approvalStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MarketListingsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? farmId,
    Value<String?>? productId,
    Value<String>? publicTitle,
    Value<String?>? publicDescription,
    Value<String>? sellingUnit,
    Value<int>? unitConversion,
    Value<int>? priceInMinorUnits,
    Value<String>? currency,
    Value<int>? minimumOrderQuantity,
    Value<String>? status,
    Value<String>? approvalStatus,
    Value<int>? rowid,
  }) {
    return MarketListingsTableCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      productId: productId ?? this.productId,
      publicTitle: publicTitle ?? this.publicTitle,
      publicDescription: publicDescription ?? this.publicDescription,
      sellingUnit: sellingUnit ?? this.sellingUnit,
      unitConversion: unitConversion ?? this.unitConversion,
      priceInMinorUnits: priceInMinorUnits ?? this.priceInMinorUnits,
      currency: currency ?? this.currency,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      status: status ?? this.status,
      approvalStatus: approvalStatus ?? this.approvalStatus,
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
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (publicTitle.present) {
      map['public_title'] = Variable<String>(publicTitle.value);
    }
    if (publicDescription.present) {
      map['public_description'] = Variable<String>(publicDescription.value);
    }
    if (sellingUnit.present) {
      map['selling_unit'] = Variable<String>(sellingUnit.value);
    }
    if (unitConversion.present) {
      map['unit_conversion'] = Variable<int>(unitConversion.value);
    }
    if (priceInMinorUnits.present) {
      map['price_in_minor_units'] = Variable<int>(priceInMinorUnits.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (minimumOrderQuantity.present) {
      map['minimum_order_quantity'] = Variable<int>(minimumOrderQuantity.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (approvalStatus.present) {
      map['approval_status'] = Variable<String>(approvalStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarketListingsTableCompanion(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('productId: $productId, ')
          ..write('publicTitle: $publicTitle, ')
          ..write('publicDescription: $publicDescription, ')
          ..write('sellingUnit: $sellingUnit, ')
          ..write('unitConversion: $unitConversion, ')
          ..write('priceInMinorUnits: $priceInMinorUnits, ')
          ..write('currency: $currency, ')
          ..write('minimumOrderQuantity: $minimumOrderQuantity, ')
          ..write('status: $status, ')
          ..write('approvalStatus: $approvalStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AnimalsTableTable animalsTable = $AnimalsTableTable(this);
  late final $MilkRecordsTableTable milkRecordsTable = $MilkRecordsTableTable(
    this,
  );
  late final $SyncOutboxTableTable syncOutboxTable = $SyncOutboxTableTable(
    this,
  );
  late final $FeedTypesTableTable feedTypesTable = $FeedTypesTableTable(this);
  late final $FeedRecordsTableTable feedRecordsTable = $FeedRecordsTableTable(
    this,
  );
  late final $EggRecordsTableTable eggRecordsTable = $EggRecordsTableTable(
    this,
  );
  late final $FlocksTableTable flocksTable = $FlocksTableTable(this);
  late final $EggProductionRecordsTableTable eggProductionRecordsTable =
      $EggProductionRecordsTableTable(this);
  late final $FlockAdjustmentsTableTable flockAdjustmentsTable =
      $FlockAdjustmentsTableTable(this);
  late final $FarmMarketProfilesTableTable farmMarketProfilesTable =
      $FarmMarketProfilesTableTable(this);
  late final $MarketProductsTableTable marketProductsTable =
      $MarketProductsTableTable(this);
  late final $InventoryBatchesTableTable inventoryBatchesTable =
      $InventoryBatchesTableTable(this);
  late final $QualityChecksTableTable qualityChecksTable =
      $QualityChecksTableTable(this);
  late final $MarketListingsTableTable marketListingsTable =
      $MarketListingsTableTable(this);
  late final AnimalsDao animalsDao = AnimalsDao(this as AppDatabase);
  late final EggRecordsDao eggRecordsDao = EggRecordsDao(this as AppDatabase);
  late final EggProductionRecordsDao eggProductionRecordsDao =
      EggProductionRecordsDao(this as AppDatabase);
  late final FlocksDao flocksDao = FlocksDao(this as AppDatabase);
  late final FlockAdjustmentsDao flockAdjustmentsDao = FlockAdjustmentsDao(
    this as AppDatabase,
  );
  late final MilkDao milkDao = MilkDao(this as AppDatabase);
  late final OutboxDao outboxDao = OutboxDao(this as AppDatabase);
  late final FeedTypesDao feedTypesDao = FeedTypesDao(this as AppDatabase);
  late final FeedRecordsDao feedRecordsDao = FeedRecordsDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    animalsTable,
    milkRecordsTable,
    syncOutboxTable,
    feedTypesTable,
    feedRecordsTable,
    eggRecordsTable,
    flocksTable,
    eggProductionRecordsTable,
    flockAdjustmentsTable,
    farmMarketProfilesTable,
    marketProductsTable,
    inventoryBatchesTable,
    qualityChecksTable,
    marketListingsTable,
  ];
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
      Value<String> status,
      Value<String?> photoUrl,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
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
                Value<String> status = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
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
typedef $$MilkRecordsTableTableCreateCompanionBuilder =
    MilkRecordsTableCompanion Function({
      required String id,
      required String farmId,
      required String animalId,
      required DateTime recordedAt,
      required String session,
      required double litres,
      Value<String?> recordedBy,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$MilkRecordsTableTableUpdateCompanionBuilder =
    MilkRecordsTableCompanion Function({
      Value<String> id,
      Value<String> farmId,
      Value<String> animalId,
      Value<DateTime> recordedAt,
      Value<String> session,
      Value<double> litres,
      Value<String?> recordedBy,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$MilkRecordsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MilkRecordsTableTable> {
  $$MilkRecordsTableTableFilterComposer({
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

  ColumnFilters<String> get animalId => $composableBuilder(
    column: $table.animalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get session => $composableBuilder(
    column: $table.session,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get litres => $composableBuilder(
    column: $table.litres,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MilkRecordsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MilkRecordsTableTable> {
  $$MilkRecordsTableTableOrderingComposer({
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

  ColumnOrderings<String> get animalId => $composableBuilder(
    column: $table.animalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get session => $composableBuilder(
    column: $table.session,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get litres => $composableBuilder(
    column: $table.litres,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MilkRecordsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MilkRecordsTableTable> {
  $$MilkRecordsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get animalId =>
      $composableBuilder(column: $table.animalId, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get session =>
      $composableBuilder(column: $table.session, builder: (column) => column);

  GeneratedColumn<double> get litres =>
      $composableBuilder(column: $table.litres, builder: (column) => column);

  GeneratedColumn<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$MilkRecordsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MilkRecordsTableTable,
          LocalMilkRecord,
          $$MilkRecordsTableTableFilterComposer,
          $$MilkRecordsTableTableOrderingComposer,
          $$MilkRecordsTableTableAnnotationComposer,
          $$MilkRecordsTableTableCreateCompanionBuilder,
          $$MilkRecordsTableTableUpdateCompanionBuilder,
          (
            LocalMilkRecord,
            BaseReferences<
              _$AppDatabase,
              $MilkRecordsTableTable,
              LocalMilkRecord
            >,
          ),
          LocalMilkRecord,
          PrefetchHooks Function()
        > {
  $$MilkRecordsTableTableTableManager(
    _$AppDatabase db,
    $MilkRecordsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MilkRecordsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MilkRecordsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MilkRecordsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> farmId = const Value.absent(),
                Value<String> animalId = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<String> session = const Value.absent(),
                Value<double> litres = const Value.absent(),
                Value<String?> recordedBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MilkRecordsTableCompanion(
                id: id,
                farmId: farmId,
                animalId: animalId,
                recordedAt: recordedAt,
                session: session,
                litres: litres,
                recordedBy: recordedBy,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String farmId,
                required String animalId,
                required DateTime recordedAt,
                required String session,
                required double litres,
                Value<String?> recordedBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MilkRecordsTableCompanion.insert(
                id: id,
                farmId: farmId,
                animalId: animalId,
                recordedAt: recordedAt,
                session: session,
                litres: litres,
                recordedBy: recordedBy,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MilkRecordsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MilkRecordsTableTable,
      LocalMilkRecord,
      $$MilkRecordsTableTableFilterComposer,
      $$MilkRecordsTableTableOrderingComposer,
      $$MilkRecordsTableTableAnnotationComposer,
      $$MilkRecordsTableTableCreateCompanionBuilder,
      $$MilkRecordsTableTableUpdateCompanionBuilder,
      (
        LocalMilkRecord,
        BaseReferences<_$AppDatabase, $MilkRecordsTableTable, LocalMilkRecord>,
      ),
      LocalMilkRecord,
      PrefetchHooks Function()
    >;
typedef $$SyncOutboxTableTableCreateCompanionBuilder =
    SyncOutboxTableCompanion Function({
      Value<int> id,
      required String entityType,
      required String operation,
      required String payload,
      Value<DateTime> createdAt,
      Value<String> status,
      Value<String?> errorMessage,
      Value<String?> idempotencyKey,
      Value<int> attemptCount,
      Value<DateTime?> nextRetryAt,
      Value<String?> lastErrorCode,
    });
typedef $$SyncOutboxTableTableUpdateCompanionBuilder =
    SyncOutboxTableCompanion Function({
      Value<int> id,
      Value<String> entityType,
      Value<String> operation,
      Value<String> payload,
      Value<DateTime> createdAt,
      Value<String> status,
      Value<String?> errorMessage,
      Value<String?> idempotencyKey,
      Value<int> attemptCount,
      Value<DateTime?> nextRetryAt,
      Value<String?> lastErrorCode,
    });

class $$SyncOutboxTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncOutboxTableTable> {
  $$SyncOutboxTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastErrorCode => $composableBuilder(
    column: $table.lastErrorCode,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncOutboxTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncOutboxTableTable> {
  $$SyncOutboxTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastErrorCode => $composableBuilder(
    column: $table.lastErrorCode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncOutboxTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncOutboxTableTable> {
  $$SyncOutboxTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => column,
  );

  GeneratedColumn<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastErrorCode => $composableBuilder(
    column: $table.lastErrorCode,
    builder: (column) => column,
  );
}

class $$SyncOutboxTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncOutboxTableTable,
          SyncOutboxItem,
          $$SyncOutboxTableTableFilterComposer,
          $$SyncOutboxTableTableOrderingComposer,
          $$SyncOutboxTableTableAnnotationComposer,
          $$SyncOutboxTableTableCreateCompanionBuilder,
          $$SyncOutboxTableTableUpdateCompanionBuilder,
          (
            SyncOutboxItem,
            BaseReferences<
              _$AppDatabase,
              $SyncOutboxTableTable,
              SyncOutboxItem
            >,
          ),
          SyncOutboxItem,
          PrefetchHooks Function()
        > {
  $$SyncOutboxTableTableTableManager(
    _$AppDatabase db,
    $SyncOutboxTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncOutboxTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncOutboxTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncOutboxTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<String?> idempotencyKey = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                Value<DateTime?> nextRetryAt = const Value.absent(),
                Value<String?> lastErrorCode = const Value.absent(),
              }) => SyncOutboxTableCompanion(
                id: id,
                entityType: entityType,
                operation: operation,
                payload: payload,
                createdAt: createdAt,
                status: status,
                errorMessage: errorMessage,
                idempotencyKey: idempotencyKey,
                attemptCount: attemptCount,
                nextRetryAt: nextRetryAt,
                lastErrorCode: lastErrorCode,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entityType,
                required String operation,
                required String payload,
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<String?> idempotencyKey = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                Value<DateTime?> nextRetryAt = const Value.absent(),
                Value<String?> lastErrorCode = const Value.absent(),
              }) => SyncOutboxTableCompanion.insert(
                id: id,
                entityType: entityType,
                operation: operation,
                payload: payload,
                createdAt: createdAt,
                status: status,
                errorMessage: errorMessage,
                idempotencyKey: idempotencyKey,
                attemptCount: attemptCount,
                nextRetryAt: nextRetryAt,
                lastErrorCode: lastErrorCode,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncOutboxTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncOutboxTableTable,
      SyncOutboxItem,
      $$SyncOutboxTableTableFilterComposer,
      $$SyncOutboxTableTableOrderingComposer,
      $$SyncOutboxTableTableAnnotationComposer,
      $$SyncOutboxTableTableCreateCompanionBuilder,
      $$SyncOutboxTableTableUpdateCompanionBuilder,
      (
        SyncOutboxItem,
        BaseReferences<_$AppDatabase, $SyncOutboxTableTable, SyncOutboxItem>,
      ),
      SyncOutboxItem,
      PrefetchHooks Function()
    >;
typedef $$FeedTypesTableTableCreateCompanionBuilder =
    FeedTypesTableCompanion Function({
      required String id,
      required String farmId,
      required String name,
      Value<String> unit,
      Value<double> unitCost,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$FeedTypesTableTableUpdateCompanionBuilder =
    FeedTypesTableCompanion Function({
      Value<String> id,
      Value<String> farmId,
      Value<String> name,
      Value<String> unit,
      Value<double> unitCost,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$FeedTypesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FeedTypesTableTable> {
  $$FeedTypesTableTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitCost => $composableBuilder(
    column: $table.unitCost,
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

class $$FeedTypesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FeedTypesTableTable> {
  $$FeedTypesTableTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitCost => $composableBuilder(
    column: $table.unitCost,
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

class $$FeedTypesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeedTypesTableTable> {
  $$FeedTypesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get unitCost =>
      $composableBuilder(column: $table.unitCost, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FeedTypesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FeedTypesTableTable,
          LocalFeedType,
          $$FeedTypesTableTableFilterComposer,
          $$FeedTypesTableTableOrderingComposer,
          $$FeedTypesTableTableAnnotationComposer,
          $$FeedTypesTableTableCreateCompanionBuilder,
          $$FeedTypesTableTableUpdateCompanionBuilder,
          (
            LocalFeedType,
            BaseReferences<_$AppDatabase, $FeedTypesTableTable, LocalFeedType>,
          ),
          LocalFeedType,
          PrefetchHooks Function()
        > {
  $$FeedTypesTableTableTableManager(
    _$AppDatabase db,
    $FeedTypesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeedTypesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeedTypesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeedTypesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> farmId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<double> unitCost = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FeedTypesTableCompanion(
                id: id,
                farmId: farmId,
                name: name,
                unit: unit,
                unitCost: unitCost,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String farmId,
                required String name,
                Value<String> unit = const Value.absent(),
                Value<double> unitCost = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FeedTypesTableCompanion.insert(
                id: id,
                farmId: farmId,
                name: name,
                unit: unit,
                unitCost: unitCost,
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

typedef $$FeedTypesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FeedTypesTableTable,
      LocalFeedType,
      $$FeedTypesTableTableFilterComposer,
      $$FeedTypesTableTableOrderingComposer,
      $$FeedTypesTableTableAnnotationComposer,
      $$FeedTypesTableTableCreateCompanionBuilder,
      $$FeedTypesTableTableUpdateCompanionBuilder,
      (
        LocalFeedType,
        BaseReferences<_$AppDatabase, $FeedTypesTableTable, LocalFeedType>,
      ),
      LocalFeedType,
      PrefetchHooks Function()
    >;
typedef $$FeedRecordsTableTableCreateCompanionBuilder =
    FeedRecordsTableCompanion Function({
      required String id,
      required String farmId,
      Value<String?> animalId,
      required String feedTypeId,
      required double quantityKg,
      required double cost,
      required DateTime recordedAt,
      Value<String?> recordedBy,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$FeedRecordsTableTableUpdateCompanionBuilder =
    FeedRecordsTableCompanion Function({
      Value<String> id,
      Value<String> farmId,
      Value<String?> animalId,
      Value<String> feedTypeId,
      Value<double> quantityKg,
      Value<double> cost,
      Value<DateTime> recordedAt,
      Value<String?> recordedBy,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$FeedRecordsTableTableFilterComposer
    extends Composer<_$AppDatabase, $FeedRecordsTableTable> {
  $$FeedRecordsTableTableFilterComposer({
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

  ColumnFilters<String> get animalId => $composableBuilder(
    column: $table.animalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get feedTypeId => $composableBuilder(
    column: $table.feedTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantityKg => $composableBuilder(
    column: $table.quantityKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FeedRecordsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FeedRecordsTableTable> {
  $$FeedRecordsTableTableOrderingComposer({
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

  ColumnOrderings<String> get animalId => $composableBuilder(
    column: $table.animalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feedTypeId => $composableBuilder(
    column: $table.feedTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantityKg => $composableBuilder(
    column: $table.quantityKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FeedRecordsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeedRecordsTableTable> {
  $$FeedRecordsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get animalId =>
      $composableBuilder(column: $table.animalId, builder: (column) => column);

  GeneratedColumn<String> get feedTypeId => $composableBuilder(
    column: $table.feedTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantityKg => $composableBuilder(
    column: $table.quantityKg,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FeedRecordsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FeedRecordsTableTable,
          LocalFeedRecord,
          $$FeedRecordsTableTableFilterComposer,
          $$FeedRecordsTableTableOrderingComposer,
          $$FeedRecordsTableTableAnnotationComposer,
          $$FeedRecordsTableTableCreateCompanionBuilder,
          $$FeedRecordsTableTableUpdateCompanionBuilder,
          (
            LocalFeedRecord,
            BaseReferences<
              _$AppDatabase,
              $FeedRecordsTableTable,
              LocalFeedRecord
            >,
          ),
          LocalFeedRecord,
          PrefetchHooks Function()
        > {
  $$FeedRecordsTableTableTableManager(
    _$AppDatabase db,
    $FeedRecordsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeedRecordsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeedRecordsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeedRecordsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> farmId = const Value.absent(),
                Value<String?> animalId = const Value.absent(),
                Value<String> feedTypeId = const Value.absent(),
                Value<double> quantityKg = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<String?> recordedBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FeedRecordsTableCompanion(
                id: id,
                farmId: farmId,
                animalId: animalId,
                feedTypeId: feedTypeId,
                quantityKg: quantityKg,
                cost: cost,
                recordedAt: recordedAt,
                recordedBy: recordedBy,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String farmId,
                Value<String?> animalId = const Value.absent(),
                required String feedTypeId,
                required double quantityKg,
                required double cost,
                required DateTime recordedAt,
                Value<String?> recordedBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FeedRecordsTableCompanion.insert(
                id: id,
                farmId: farmId,
                animalId: animalId,
                feedTypeId: feedTypeId,
                quantityKg: quantityKg,
                cost: cost,
                recordedAt: recordedAt,
                recordedBy: recordedBy,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FeedRecordsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FeedRecordsTableTable,
      LocalFeedRecord,
      $$FeedRecordsTableTableFilterComposer,
      $$FeedRecordsTableTableOrderingComposer,
      $$FeedRecordsTableTableAnnotationComposer,
      $$FeedRecordsTableTableCreateCompanionBuilder,
      $$FeedRecordsTableTableUpdateCompanionBuilder,
      (
        LocalFeedRecord,
        BaseReferences<_$AppDatabase, $FeedRecordsTableTable, LocalFeedRecord>,
      ),
      LocalFeedRecord,
      PrefetchHooks Function()
    >;
typedef $$EggRecordsTableTableCreateCompanionBuilder =
    EggRecordsTableCompanion Function({
      required String id,
      required String farmId,
      required String flockName,
      Value<String> productionType,
      required DateTime recordedAt,
      required int quantity,
      Value<int> brokenCount,
      Value<String?> notes,
      Value<String?> recordedBy,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$EggRecordsTableTableUpdateCompanionBuilder =
    EggRecordsTableCompanion Function({
      Value<String> id,
      Value<String> farmId,
      Value<String> flockName,
      Value<String> productionType,
      Value<DateTime> recordedAt,
      Value<int> quantity,
      Value<int> brokenCount,
      Value<String?> notes,
      Value<String?> recordedBy,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$EggRecordsTableTableFilterComposer
    extends Composer<_$AppDatabase, $EggRecordsTableTable> {
  $$EggRecordsTableTableFilterComposer({
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

  ColumnFilters<String> get flockName => $composableBuilder(
    column: $table.flockName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productionType => $composableBuilder(
    column: $table.productionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get brokenCount => $composableBuilder(
    column: $table.brokenCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EggRecordsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EggRecordsTableTable> {
  $$EggRecordsTableTableOrderingComposer({
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

  ColumnOrderings<String> get flockName => $composableBuilder(
    column: $table.flockName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productionType => $composableBuilder(
    column: $table.productionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get brokenCount => $composableBuilder(
    column: $table.brokenCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EggRecordsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EggRecordsTableTable> {
  $$EggRecordsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get flockName =>
      $composableBuilder(column: $table.flockName, builder: (column) => column);

  GeneratedColumn<String> get productionType => $composableBuilder(
    column: $table.productionType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get brokenCount => $composableBuilder(
    column: $table.brokenCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$EggRecordsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EggRecordsTableTable,
          LocalEggRecord,
          $$EggRecordsTableTableFilterComposer,
          $$EggRecordsTableTableOrderingComposer,
          $$EggRecordsTableTableAnnotationComposer,
          $$EggRecordsTableTableCreateCompanionBuilder,
          $$EggRecordsTableTableUpdateCompanionBuilder,
          (
            LocalEggRecord,
            BaseReferences<
              _$AppDatabase,
              $EggRecordsTableTable,
              LocalEggRecord
            >,
          ),
          LocalEggRecord,
          PrefetchHooks Function()
        > {
  $$EggRecordsTableTableTableManager(
    _$AppDatabase db,
    $EggRecordsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EggRecordsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EggRecordsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EggRecordsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> farmId = const Value.absent(),
                Value<String> flockName = const Value.absent(),
                Value<String> productionType = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> brokenCount = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> recordedBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EggRecordsTableCompanion(
                id: id,
                farmId: farmId,
                flockName: flockName,
                productionType: productionType,
                recordedAt: recordedAt,
                quantity: quantity,
                brokenCount: brokenCount,
                notes: notes,
                recordedBy: recordedBy,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String farmId,
                required String flockName,
                Value<String> productionType = const Value.absent(),
                required DateTime recordedAt,
                required int quantity,
                Value<int> brokenCount = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> recordedBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EggRecordsTableCompanion.insert(
                id: id,
                farmId: farmId,
                flockName: flockName,
                productionType: productionType,
                recordedAt: recordedAt,
                quantity: quantity,
                brokenCount: brokenCount,
                notes: notes,
                recordedBy: recordedBy,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EggRecordsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EggRecordsTableTable,
      LocalEggRecord,
      $$EggRecordsTableTableFilterComposer,
      $$EggRecordsTableTableOrderingComposer,
      $$EggRecordsTableTableAnnotationComposer,
      $$EggRecordsTableTableCreateCompanionBuilder,
      $$EggRecordsTableTableUpdateCompanionBuilder,
      (
        LocalEggRecord,
        BaseReferences<_$AppDatabase, $EggRecordsTableTable, LocalEggRecord>,
      ),
      LocalEggRecord,
      PrefetchHooks Function()
    >;
typedef $$FlocksTableTableCreateCompanionBuilder =
    FlocksTableCompanion Function({
      required String id,
      required String farmId,
      required String flockCode,
      required String name,
      required String breed,
      Value<String> purpose,
      Value<int> numberOfBirds,
      Value<int> numberOfLayingHens,
      required DateTime arrivalDate,
      Value<DateTime?> hatchDate,
      Value<String?> housingType,
      Value<String?> source,
      Value<String> status,
      Value<String?> notes,
      Value<String?> createdBy,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$FlocksTableTableUpdateCompanionBuilder =
    FlocksTableCompanion Function({
      Value<String> id,
      Value<String> farmId,
      Value<String> flockCode,
      Value<String> name,
      Value<String> breed,
      Value<String> purpose,
      Value<int> numberOfBirds,
      Value<int> numberOfLayingHens,
      Value<DateTime> arrivalDate,
      Value<DateTime?> hatchDate,
      Value<String?> housingType,
      Value<String?> source,
      Value<String> status,
      Value<String?> notes,
      Value<String?> createdBy,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

class $$FlocksTableTableFilterComposer
    extends Composer<_$AppDatabase, $FlocksTableTable> {
  $$FlocksTableTableFilterComposer({
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

  ColumnFilters<String> get flockCode => $composableBuilder(
    column: $table.flockCode,
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

  ColumnFilters<String> get purpose => $composableBuilder(
    column: $table.purpose,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfBirds => $composableBuilder(
    column: $table.numberOfBirds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfLayingHens => $composableBuilder(
    column: $table.numberOfLayingHens,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get arrivalDate => $composableBuilder(
    column: $table.arrivalDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hatchDate => $composableBuilder(
    column: $table.hatchDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get housingType => $composableBuilder(
    column: $table.housingType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
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

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FlocksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FlocksTableTable> {
  $$FlocksTableTableOrderingComposer({
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

  ColumnOrderings<String> get flockCode => $composableBuilder(
    column: $table.flockCode,
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

  ColumnOrderings<String> get purpose => $composableBuilder(
    column: $table.purpose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfBirds => $composableBuilder(
    column: $table.numberOfBirds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfLayingHens => $composableBuilder(
    column: $table.numberOfLayingHens,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get arrivalDate => $composableBuilder(
    column: $table.arrivalDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hatchDate => $composableBuilder(
    column: $table.hatchDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get housingType => $composableBuilder(
    column: $table.housingType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
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

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FlocksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FlocksTableTable> {
  $$FlocksTableTableAnnotationComposer({
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

  GeneratedColumn<String> get flockCode =>
      $composableBuilder(column: $table.flockCode, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<String> get purpose =>
      $composableBuilder(column: $table.purpose, builder: (column) => column);

  GeneratedColumn<int> get numberOfBirds => $composableBuilder(
    column: $table.numberOfBirds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numberOfLayingHens => $composableBuilder(
    column: $table.numberOfLayingHens,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get arrivalDate => $composableBuilder(
    column: $table.arrivalDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get hatchDate =>
      $composableBuilder(column: $table.hatchDate, builder: (column) => column);

  GeneratedColumn<String> get housingType => $composableBuilder(
    column: $table.housingType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$FlocksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FlocksTableTable,
          LocalFlock,
          $$FlocksTableTableFilterComposer,
          $$FlocksTableTableOrderingComposer,
          $$FlocksTableTableAnnotationComposer,
          $$FlocksTableTableCreateCompanionBuilder,
          $$FlocksTableTableUpdateCompanionBuilder,
          (
            LocalFlock,
            BaseReferences<_$AppDatabase, $FlocksTableTable, LocalFlock>,
          ),
          LocalFlock,
          PrefetchHooks Function()
        > {
  $$FlocksTableTableTableManager(_$AppDatabase db, $FlocksTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FlocksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FlocksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FlocksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> farmId = const Value.absent(),
                Value<String> flockCode = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> breed = const Value.absent(),
                Value<String> purpose = const Value.absent(),
                Value<int> numberOfBirds = const Value.absent(),
                Value<int> numberOfLayingHens = const Value.absent(),
                Value<DateTime> arrivalDate = const Value.absent(),
                Value<DateTime?> hatchDate = const Value.absent(),
                Value<String?> housingType = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FlocksTableCompanion(
                id: id,
                farmId: farmId,
                flockCode: flockCode,
                name: name,
                breed: breed,
                purpose: purpose,
                numberOfBirds: numberOfBirds,
                numberOfLayingHens: numberOfLayingHens,
                arrivalDate: arrivalDate,
                hatchDate: hatchDate,
                housingType: housingType,
                source: source,
                status: status,
                notes: notes,
                createdBy: createdBy,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String farmId,
                required String flockCode,
                required String name,
                required String breed,
                Value<String> purpose = const Value.absent(),
                Value<int> numberOfBirds = const Value.absent(),
                Value<int> numberOfLayingHens = const Value.absent(),
                required DateTime arrivalDate,
                Value<DateTime?> hatchDate = const Value.absent(),
                Value<String?> housingType = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FlocksTableCompanion.insert(
                id: id,
                farmId: farmId,
                flockCode: flockCode,
                name: name,
                breed: breed,
                purpose: purpose,
                numberOfBirds: numberOfBirds,
                numberOfLayingHens: numberOfLayingHens,
                arrivalDate: arrivalDate,
                hatchDate: hatchDate,
                housingType: housingType,
                source: source,
                status: status,
                notes: notes,
                createdBy: createdBy,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FlocksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FlocksTableTable,
      LocalFlock,
      $$FlocksTableTableFilterComposer,
      $$FlocksTableTableOrderingComposer,
      $$FlocksTableTableAnnotationComposer,
      $$FlocksTableTableCreateCompanionBuilder,
      $$FlocksTableTableUpdateCompanionBuilder,
      (
        LocalFlock,
        BaseReferences<_$AppDatabase, $FlocksTableTable, LocalFlock>,
      ),
      LocalFlock,
      PrefetchHooks Function()
    >;
typedef $$EggProductionRecordsTableTableCreateCompanionBuilder =
    EggProductionRecordsTableCompanion Function({
      required String id,
      required String farmId,
      required String flockId,
      required DateTime productionDate,
      Value<int> goodEggs,
      Value<int> crackedEggs,
      Value<int> rejectedEggs,
      Value<int> farmUseEggs,
      Value<int> soldDirectlyEggs,
      Value<int> availableEggs,
      Value<String?> recordedBy,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$EggProductionRecordsTableTableUpdateCompanionBuilder =
    EggProductionRecordsTableCompanion Function({
      Value<String> id,
      Value<String> farmId,
      Value<String> flockId,
      Value<DateTime> productionDate,
      Value<int> goodEggs,
      Value<int> crackedEggs,
      Value<int> rejectedEggs,
      Value<int> farmUseEggs,
      Value<int> soldDirectlyEggs,
      Value<int> availableEggs,
      Value<String?> recordedBy,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$EggProductionRecordsTableTableFilterComposer
    extends Composer<_$AppDatabase, $EggProductionRecordsTableTable> {
  $$EggProductionRecordsTableTableFilterComposer({
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

  ColumnFilters<String> get flockId => $composableBuilder(
    column: $table.flockId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get productionDate => $composableBuilder(
    column: $table.productionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get goodEggs => $composableBuilder(
    column: $table.goodEggs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get crackedEggs => $composableBuilder(
    column: $table.crackedEggs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rejectedEggs => $composableBuilder(
    column: $table.rejectedEggs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get farmUseEggs => $composableBuilder(
    column: $table.farmUseEggs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get soldDirectlyEggs => $composableBuilder(
    column: $table.soldDirectlyEggs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get availableEggs => $composableBuilder(
    column: $table.availableEggs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
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

class $$EggProductionRecordsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EggProductionRecordsTableTable> {
  $$EggProductionRecordsTableTableOrderingComposer({
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

  ColumnOrderings<String> get flockId => $composableBuilder(
    column: $table.flockId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get productionDate => $composableBuilder(
    column: $table.productionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get goodEggs => $composableBuilder(
    column: $table.goodEggs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get crackedEggs => $composableBuilder(
    column: $table.crackedEggs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rejectedEggs => $composableBuilder(
    column: $table.rejectedEggs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get farmUseEggs => $composableBuilder(
    column: $table.farmUseEggs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get soldDirectlyEggs => $composableBuilder(
    column: $table.soldDirectlyEggs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get availableEggs => $composableBuilder(
    column: $table.availableEggs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
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

class $$EggProductionRecordsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EggProductionRecordsTableTable> {
  $$EggProductionRecordsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get flockId =>
      $composableBuilder(column: $table.flockId, builder: (column) => column);

  GeneratedColumn<DateTime> get productionDate => $composableBuilder(
    column: $table.productionDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get goodEggs =>
      $composableBuilder(column: $table.goodEggs, builder: (column) => column);

  GeneratedColumn<int> get crackedEggs => $composableBuilder(
    column: $table.crackedEggs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rejectedEggs => $composableBuilder(
    column: $table.rejectedEggs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get farmUseEggs => $composableBuilder(
    column: $table.farmUseEggs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get soldDirectlyEggs => $composableBuilder(
    column: $table.soldDirectlyEggs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get availableEggs => $composableBuilder(
    column: $table.availableEggs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$EggProductionRecordsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EggProductionRecordsTableTable,
          LocalEggProductionRecord,
          $$EggProductionRecordsTableTableFilterComposer,
          $$EggProductionRecordsTableTableOrderingComposer,
          $$EggProductionRecordsTableTableAnnotationComposer,
          $$EggProductionRecordsTableTableCreateCompanionBuilder,
          $$EggProductionRecordsTableTableUpdateCompanionBuilder,
          (
            LocalEggProductionRecord,
            BaseReferences<
              _$AppDatabase,
              $EggProductionRecordsTableTable,
              LocalEggProductionRecord
            >,
          ),
          LocalEggProductionRecord,
          PrefetchHooks Function()
        > {
  $$EggProductionRecordsTableTableTableManager(
    _$AppDatabase db,
    $EggProductionRecordsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EggProductionRecordsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$EggProductionRecordsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$EggProductionRecordsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> farmId = const Value.absent(),
                Value<String> flockId = const Value.absent(),
                Value<DateTime> productionDate = const Value.absent(),
                Value<int> goodEggs = const Value.absent(),
                Value<int> crackedEggs = const Value.absent(),
                Value<int> rejectedEggs = const Value.absent(),
                Value<int> farmUseEggs = const Value.absent(),
                Value<int> soldDirectlyEggs = const Value.absent(),
                Value<int> availableEggs = const Value.absent(),
                Value<String?> recordedBy = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EggProductionRecordsTableCompanion(
                id: id,
                farmId: farmId,
                flockId: flockId,
                productionDate: productionDate,
                goodEggs: goodEggs,
                crackedEggs: crackedEggs,
                rejectedEggs: rejectedEggs,
                farmUseEggs: farmUseEggs,
                soldDirectlyEggs: soldDirectlyEggs,
                availableEggs: availableEggs,
                recordedBy: recordedBy,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String farmId,
                required String flockId,
                required DateTime productionDate,
                Value<int> goodEggs = const Value.absent(),
                Value<int> crackedEggs = const Value.absent(),
                Value<int> rejectedEggs = const Value.absent(),
                Value<int> farmUseEggs = const Value.absent(),
                Value<int> soldDirectlyEggs = const Value.absent(),
                Value<int> availableEggs = const Value.absent(),
                Value<String?> recordedBy = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EggProductionRecordsTableCompanion.insert(
                id: id,
                farmId: farmId,
                flockId: flockId,
                productionDate: productionDate,
                goodEggs: goodEggs,
                crackedEggs: crackedEggs,
                rejectedEggs: rejectedEggs,
                farmUseEggs: farmUseEggs,
                soldDirectlyEggs: soldDirectlyEggs,
                availableEggs: availableEggs,
                recordedBy: recordedBy,
                notes: notes,
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

typedef $$EggProductionRecordsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EggProductionRecordsTableTable,
      LocalEggProductionRecord,
      $$EggProductionRecordsTableTableFilterComposer,
      $$EggProductionRecordsTableTableOrderingComposer,
      $$EggProductionRecordsTableTableAnnotationComposer,
      $$EggProductionRecordsTableTableCreateCompanionBuilder,
      $$EggProductionRecordsTableTableUpdateCompanionBuilder,
      (
        LocalEggProductionRecord,
        BaseReferences<
          _$AppDatabase,
          $EggProductionRecordsTableTable,
          LocalEggProductionRecord
        >,
      ),
      LocalEggProductionRecord,
      PrefetchHooks Function()
    >;
typedef $$FlockAdjustmentsTableTableCreateCompanionBuilder =
    FlockAdjustmentsTableCompanion Function({
      required String id,
      required String farmId,
      required String flockId,
      required String adjustmentType,
      required int birdsChanged,
      Value<int> hensChanged,
      Value<String?> reason,
      required DateTime recordedAt,
      Value<String?> recordedBy,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$FlockAdjustmentsTableTableUpdateCompanionBuilder =
    FlockAdjustmentsTableCompanion Function({
      Value<String> id,
      Value<String> farmId,
      Value<String> flockId,
      Value<String> adjustmentType,
      Value<int> birdsChanged,
      Value<int> hensChanged,
      Value<String?> reason,
      Value<DateTime> recordedAt,
      Value<String?> recordedBy,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$FlockAdjustmentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $FlockAdjustmentsTableTable> {
  $$FlockAdjustmentsTableTableFilterComposer({
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

  ColumnFilters<String> get flockId => $composableBuilder(
    column: $table.flockId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adjustmentType => $composableBuilder(
    column: $table.adjustmentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get birdsChanged => $composableBuilder(
    column: $table.birdsChanged,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hensChanged => $composableBuilder(
    column: $table.hensChanged,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FlockAdjustmentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FlockAdjustmentsTableTable> {
  $$FlockAdjustmentsTableTableOrderingComposer({
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

  ColumnOrderings<String> get flockId => $composableBuilder(
    column: $table.flockId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adjustmentType => $composableBuilder(
    column: $table.adjustmentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get birdsChanged => $composableBuilder(
    column: $table.birdsChanged,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hensChanged => $composableBuilder(
    column: $table.hensChanged,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FlockAdjustmentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FlockAdjustmentsTableTable> {
  $$FlockAdjustmentsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get flockId =>
      $composableBuilder(column: $table.flockId, builder: (column) => column);

  GeneratedColumn<String> get adjustmentType => $composableBuilder(
    column: $table.adjustmentType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get birdsChanged => $composableBuilder(
    column: $table.birdsChanged,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hensChanged => $composableBuilder(
    column: $table.hensChanged,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedBy => $composableBuilder(
    column: $table.recordedBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FlockAdjustmentsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FlockAdjustmentsTableTable,
          LocalFlockAdjustment,
          $$FlockAdjustmentsTableTableFilterComposer,
          $$FlockAdjustmentsTableTableOrderingComposer,
          $$FlockAdjustmentsTableTableAnnotationComposer,
          $$FlockAdjustmentsTableTableCreateCompanionBuilder,
          $$FlockAdjustmentsTableTableUpdateCompanionBuilder,
          (
            LocalFlockAdjustment,
            BaseReferences<
              _$AppDatabase,
              $FlockAdjustmentsTableTable,
              LocalFlockAdjustment
            >,
          ),
          LocalFlockAdjustment,
          PrefetchHooks Function()
        > {
  $$FlockAdjustmentsTableTableTableManager(
    _$AppDatabase db,
    $FlockAdjustmentsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FlockAdjustmentsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$FlockAdjustmentsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FlockAdjustmentsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> farmId = const Value.absent(),
                Value<String> flockId = const Value.absent(),
                Value<String> adjustmentType = const Value.absent(),
                Value<int> birdsChanged = const Value.absent(),
                Value<int> hensChanged = const Value.absent(),
                Value<String?> reason = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<String?> recordedBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FlockAdjustmentsTableCompanion(
                id: id,
                farmId: farmId,
                flockId: flockId,
                adjustmentType: adjustmentType,
                birdsChanged: birdsChanged,
                hensChanged: hensChanged,
                reason: reason,
                recordedAt: recordedAt,
                recordedBy: recordedBy,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String farmId,
                required String flockId,
                required String adjustmentType,
                required int birdsChanged,
                Value<int> hensChanged = const Value.absent(),
                Value<String?> reason = const Value.absent(),
                required DateTime recordedAt,
                Value<String?> recordedBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FlockAdjustmentsTableCompanion.insert(
                id: id,
                farmId: farmId,
                flockId: flockId,
                adjustmentType: adjustmentType,
                birdsChanged: birdsChanged,
                hensChanged: hensChanged,
                reason: reason,
                recordedAt: recordedAt,
                recordedBy: recordedBy,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FlockAdjustmentsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FlockAdjustmentsTableTable,
      LocalFlockAdjustment,
      $$FlockAdjustmentsTableTableFilterComposer,
      $$FlockAdjustmentsTableTableOrderingComposer,
      $$FlockAdjustmentsTableTableAnnotationComposer,
      $$FlockAdjustmentsTableTableCreateCompanionBuilder,
      $$FlockAdjustmentsTableTableUpdateCompanionBuilder,
      (
        LocalFlockAdjustment,
        BaseReferences<
          _$AppDatabase,
          $FlockAdjustmentsTableTable,
          LocalFlockAdjustment
        >,
      ),
      LocalFlockAdjustment,
      PrefetchHooks Function()
    >;
typedef $$FarmMarketProfilesTableTableCreateCompanionBuilder =
    FarmMarketProfilesTableCompanion Function({
      required String farmId,
      required String publicFarmName,
      Value<String?> publicDescription,
      Value<String?> publicPhone,
      Value<String?> publicEmail,
      required String generalLocation,
      Value<String> marketplaceStatus,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$FarmMarketProfilesTableTableUpdateCompanionBuilder =
    FarmMarketProfilesTableCompanion Function({
      Value<String> farmId,
      Value<String> publicFarmName,
      Value<String?> publicDescription,
      Value<String?> publicPhone,
      Value<String?> publicEmail,
      Value<String> generalLocation,
      Value<String> marketplaceStatus,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$FarmMarketProfilesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FarmMarketProfilesTableTable> {
  $$FarmMarketProfilesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get farmId => $composableBuilder(
    column: $table.farmId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publicFarmName => $composableBuilder(
    column: $table.publicFarmName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publicDescription => $composableBuilder(
    column: $table.publicDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publicPhone => $composableBuilder(
    column: $table.publicPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publicEmail => $composableBuilder(
    column: $table.publicEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get generalLocation => $composableBuilder(
    column: $table.generalLocation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get marketplaceStatus => $composableBuilder(
    column: $table.marketplaceStatus,
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

class $$FarmMarketProfilesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmMarketProfilesTableTable> {
  $$FarmMarketProfilesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get farmId => $composableBuilder(
    column: $table.farmId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publicFarmName => $composableBuilder(
    column: $table.publicFarmName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publicDescription => $composableBuilder(
    column: $table.publicDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publicPhone => $composableBuilder(
    column: $table.publicPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publicEmail => $composableBuilder(
    column: $table.publicEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get generalLocation => $composableBuilder(
    column: $table.generalLocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get marketplaceStatus => $composableBuilder(
    column: $table.marketplaceStatus,
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

class $$FarmMarketProfilesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmMarketProfilesTableTable> {
  $$FarmMarketProfilesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get farmId =>
      $composableBuilder(column: $table.farmId, builder: (column) => column);

  GeneratedColumn<String> get publicFarmName => $composableBuilder(
    column: $table.publicFarmName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get publicDescription => $composableBuilder(
    column: $table.publicDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get publicPhone => $composableBuilder(
    column: $table.publicPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get publicEmail => $composableBuilder(
    column: $table.publicEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get generalLocation => $composableBuilder(
    column: $table.generalLocation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get marketplaceStatus => $composableBuilder(
    column: $table.marketplaceStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FarmMarketProfilesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FarmMarketProfilesTableTable,
          LocalFarmMarketProfile,
          $$FarmMarketProfilesTableTableFilterComposer,
          $$FarmMarketProfilesTableTableOrderingComposer,
          $$FarmMarketProfilesTableTableAnnotationComposer,
          $$FarmMarketProfilesTableTableCreateCompanionBuilder,
          $$FarmMarketProfilesTableTableUpdateCompanionBuilder,
          (
            LocalFarmMarketProfile,
            BaseReferences<
              _$AppDatabase,
              $FarmMarketProfilesTableTable,
              LocalFarmMarketProfile
            >,
          ),
          LocalFarmMarketProfile,
          PrefetchHooks Function()
        > {
  $$FarmMarketProfilesTableTableTableManager(
    _$AppDatabase db,
    $FarmMarketProfilesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmMarketProfilesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$FarmMarketProfilesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FarmMarketProfilesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> farmId = const Value.absent(),
                Value<String> publicFarmName = const Value.absent(),
                Value<String?> publicDescription = const Value.absent(),
                Value<String?> publicPhone = const Value.absent(),
                Value<String?> publicEmail = const Value.absent(),
                Value<String> generalLocation = const Value.absent(),
                Value<String> marketplaceStatus = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FarmMarketProfilesTableCompanion(
                farmId: farmId,
                publicFarmName: publicFarmName,
                publicDescription: publicDescription,
                publicPhone: publicPhone,
                publicEmail: publicEmail,
                generalLocation: generalLocation,
                marketplaceStatus: marketplaceStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String farmId,
                required String publicFarmName,
                Value<String?> publicDescription = const Value.absent(),
                Value<String?> publicPhone = const Value.absent(),
                Value<String?> publicEmail = const Value.absent(),
                required String generalLocation,
                Value<String> marketplaceStatus = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FarmMarketProfilesTableCompanion.insert(
                farmId: farmId,
                publicFarmName: publicFarmName,
                publicDescription: publicDescription,
                publicPhone: publicPhone,
                publicEmail: publicEmail,
                generalLocation: generalLocation,
                marketplaceStatus: marketplaceStatus,
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

typedef $$FarmMarketProfilesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FarmMarketProfilesTableTable,
      LocalFarmMarketProfile,
      $$FarmMarketProfilesTableTableFilterComposer,
      $$FarmMarketProfilesTableTableOrderingComposer,
      $$FarmMarketProfilesTableTableAnnotationComposer,
      $$FarmMarketProfilesTableTableCreateCompanionBuilder,
      $$FarmMarketProfilesTableTableUpdateCompanionBuilder,
      (
        LocalFarmMarketProfile,
        BaseReferences<
          _$AppDatabase,
          $FarmMarketProfilesTableTable,
          LocalFarmMarketProfile
        >,
      ),
      LocalFarmMarketProfile,
      PrefetchHooks Function()
    >;
typedef $$MarketProductsTableTableCreateCompanionBuilder =
    MarketProductsTableCompanion Function({
      required String id,
      required String productCode,
      required String category,
      required String nameEn,
      required String nameAm,
      required String nameOm,
      required String baseInventoryUnit,
      Value<bool> active,
      Value<int> rowid,
    });
typedef $$MarketProductsTableTableUpdateCompanionBuilder =
    MarketProductsTableCompanion Function({
      Value<String> id,
      Value<String> productCode,
      Value<String> category,
      Value<String> nameEn,
      Value<String> nameAm,
      Value<String> nameOm,
      Value<String> baseInventoryUnit,
      Value<bool> active,
      Value<int> rowid,
    });

class $$MarketProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MarketProductsTableTable> {
  $$MarketProductsTableTableFilterComposer({
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

  ColumnFilters<String> get productCode => $composableBuilder(
    column: $table.productCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameAm => $composableBuilder(
    column: $table.nameAm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameOm => $composableBuilder(
    column: $table.nameOm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baseInventoryUnit => $composableBuilder(
    column: $table.baseInventoryUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MarketProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MarketProductsTableTable> {
  $$MarketProductsTableTableOrderingComposer({
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

  ColumnOrderings<String> get productCode => $composableBuilder(
    column: $table.productCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameAm => $composableBuilder(
    column: $table.nameAm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameOm => $composableBuilder(
    column: $table.nameOm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baseInventoryUnit => $composableBuilder(
    column: $table.baseInventoryUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MarketProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MarketProductsTableTable> {
  $$MarketProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productCode => $composableBuilder(
    column: $table.productCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get nameAm =>
      $composableBuilder(column: $table.nameAm, builder: (column) => column);

  GeneratedColumn<String> get nameOm =>
      $composableBuilder(column: $table.nameOm, builder: (column) => column);

  GeneratedColumn<String> get baseInventoryUnit => $composableBuilder(
    column: $table.baseInventoryUnit,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);
}

class $$MarketProductsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MarketProductsTableTable,
          LocalMarketProduct,
          $$MarketProductsTableTableFilterComposer,
          $$MarketProductsTableTableOrderingComposer,
          $$MarketProductsTableTableAnnotationComposer,
          $$MarketProductsTableTableCreateCompanionBuilder,
          $$MarketProductsTableTableUpdateCompanionBuilder,
          (
            LocalMarketProduct,
            BaseReferences<
              _$AppDatabase,
              $MarketProductsTableTable,
              LocalMarketProduct
            >,
          ),
          LocalMarketProduct,
          PrefetchHooks Function()
        > {
  $$MarketProductsTableTableTableManager(
    _$AppDatabase db,
    $MarketProductsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MarketProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MarketProductsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MarketProductsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> productCode = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> nameEn = const Value.absent(),
                Value<String> nameAm = const Value.absent(),
                Value<String> nameOm = const Value.absent(),
                Value<String> baseInventoryUnit = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MarketProductsTableCompanion(
                id: id,
                productCode: productCode,
                category: category,
                nameEn: nameEn,
                nameAm: nameAm,
                nameOm: nameOm,
                baseInventoryUnit: baseInventoryUnit,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String productCode,
                required String category,
                required String nameEn,
                required String nameAm,
                required String nameOm,
                required String baseInventoryUnit,
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MarketProductsTableCompanion.insert(
                id: id,
                productCode: productCode,
                category: category,
                nameEn: nameEn,
                nameAm: nameAm,
                nameOm: nameOm,
                baseInventoryUnit: baseInventoryUnit,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MarketProductsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MarketProductsTableTable,
      LocalMarketProduct,
      $$MarketProductsTableTableFilterComposer,
      $$MarketProductsTableTableOrderingComposer,
      $$MarketProductsTableTableAnnotationComposer,
      $$MarketProductsTableTableCreateCompanionBuilder,
      $$MarketProductsTableTableUpdateCompanionBuilder,
      (
        LocalMarketProduct,
        BaseReferences<
          _$AppDatabase,
          $MarketProductsTableTable,
          LocalMarketProduct
        >,
      ),
      LocalMarketProduct,
      PrefetchHooks Function()
    >;
typedef $$InventoryBatchesTableTableCreateCompanionBuilder =
    InventoryBatchesTableCompanion Function({
      required String id,
      required String farmId,
      Value<String?> productId,
      required String batchCode,
      required String sourceType,
      required double producedQuantity,
      Value<double> approvedQuantity,
      Value<double> availableQuantity,
      required String baseUnit,
      required DateTime producedAt,
      Value<DateTime?> expiresAt,
      Value<String> qualityStatus,
      Value<String> marketplaceStatus,
      Value<int> version,
      Value<int> rowid,
    });
typedef $$InventoryBatchesTableTableUpdateCompanionBuilder =
    InventoryBatchesTableCompanion Function({
      Value<String> id,
      Value<String> farmId,
      Value<String?> productId,
      Value<String> batchCode,
      Value<String> sourceType,
      Value<double> producedQuantity,
      Value<double> approvedQuantity,
      Value<double> availableQuantity,
      Value<String> baseUnit,
      Value<DateTime> producedAt,
      Value<DateTime?> expiresAt,
      Value<String> qualityStatus,
      Value<String> marketplaceStatus,
      Value<int> version,
      Value<int> rowid,
    });

class $$InventoryBatchesTableTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryBatchesTableTable> {
  $$InventoryBatchesTableTableFilterComposer({
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

  ColumnFilters<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchCode => $composableBuilder(
    column: $table.batchCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get producedQuantity => $composableBuilder(
    column: $table.producedQuantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get approvedQuantity => $composableBuilder(
    column: $table.approvedQuantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get availableQuantity => $composableBuilder(
    column: $table.availableQuantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baseUnit => $composableBuilder(
    column: $table.baseUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get producedAt => $composableBuilder(
    column: $table.producedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get qualityStatus => $composableBuilder(
    column: $table.qualityStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get marketplaceStatus => $composableBuilder(
    column: $table.marketplaceStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InventoryBatchesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryBatchesTableTable> {
  $$InventoryBatchesTableTableOrderingComposer({
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

  ColumnOrderings<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchCode => $composableBuilder(
    column: $table.batchCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get producedQuantity => $composableBuilder(
    column: $table.producedQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get approvedQuantity => $composableBuilder(
    column: $table.approvedQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get availableQuantity => $composableBuilder(
    column: $table.availableQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baseUnit => $composableBuilder(
    column: $table.baseUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get producedAt => $composableBuilder(
    column: $table.producedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qualityStatus => $composableBuilder(
    column: $table.qualityStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get marketplaceStatus => $composableBuilder(
    column: $table.marketplaceStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InventoryBatchesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryBatchesTableTable> {
  $$InventoryBatchesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get batchCode =>
      $composableBuilder(column: $table.batchCode, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get producedQuantity => $composableBuilder(
    column: $table.producedQuantity,
    builder: (column) => column,
  );

  GeneratedColumn<double> get approvedQuantity => $composableBuilder(
    column: $table.approvedQuantity,
    builder: (column) => column,
  );

  GeneratedColumn<double> get availableQuantity => $composableBuilder(
    column: $table.availableQuantity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get baseUnit =>
      $composableBuilder(column: $table.baseUnit, builder: (column) => column);

  GeneratedColumn<DateTime> get producedAt => $composableBuilder(
    column: $table.producedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<String> get qualityStatus => $composableBuilder(
    column: $table.qualityStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get marketplaceStatus => $composableBuilder(
    column: $table.marketplaceStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);
}

class $$InventoryBatchesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InventoryBatchesTableTable,
          LocalInventoryBatch,
          $$InventoryBatchesTableTableFilterComposer,
          $$InventoryBatchesTableTableOrderingComposer,
          $$InventoryBatchesTableTableAnnotationComposer,
          $$InventoryBatchesTableTableCreateCompanionBuilder,
          $$InventoryBatchesTableTableUpdateCompanionBuilder,
          (
            LocalInventoryBatch,
            BaseReferences<
              _$AppDatabase,
              $InventoryBatchesTableTable,
              LocalInventoryBatch
            >,
          ),
          LocalInventoryBatch,
          PrefetchHooks Function()
        > {
  $$InventoryBatchesTableTableTableManager(
    _$AppDatabase db,
    $InventoryBatchesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryBatchesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$InventoryBatchesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$InventoryBatchesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> farmId = const Value.absent(),
                Value<String?> productId = const Value.absent(),
                Value<String> batchCode = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<double> producedQuantity = const Value.absent(),
                Value<double> approvedQuantity = const Value.absent(),
                Value<double> availableQuantity = const Value.absent(),
                Value<String> baseUnit = const Value.absent(),
                Value<DateTime> producedAt = const Value.absent(),
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<String> qualityStatus = const Value.absent(),
                Value<String> marketplaceStatus = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InventoryBatchesTableCompanion(
                id: id,
                farmId: farmId,
                productId: productId,
                batchCode: batchCode,
                sourceType: sourceType,
                producedQuantity: producedQuantity,
                approvedQuantity: approvedQuantity,
                availableQuantity: availableQuantity,
                baseUnit: baseUnit,
                producedAt: producedAt,
                expiresAt: expiresAt,
                qualityStatus: qualityStatus,
                marketplaceStatus: marketplaceStatus,
                version: version,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String farmId,
                Value<String?> productId = const Value.absent(),
                required String batchCode,
                required String sourceType,
                required double producedQuantity,
                Value<double> approvedQuantity = const Value.absent(),
                Value<double> availableQuantity = const Value.absent(),
                required String baseUnit,
                required DateTime producedAt,
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<String> qualityStatus = const Value.absent(),
                Value<String> marketplaceStatus = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InventoryBatchesTableCompanion.insert(
                id: id,
                farmId: farmId,
                productId: productId,
                batchCode: batchCode,
                sourceType: sourceType,
                producedQuantity: producedQuantity,
                approvedQuantity: approvedQuantity,
                availableQuantity: availableQuantity,
                baseUnit: baseUnit,
                producedAt: producedAt,
                expiresAt: expiresAt,
                qualityStatus: qualityStatus,
                marketplaceStatus: marketplaceStatus,
                version: version,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InventoryBatchesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InventoryBatchesTableTable,
      LocalInventoryBatch,
      $$InventoryBatchesTableTableFilterComposer,
      $$InventoryBatchesTableTableOrderingComposer,
      $$InventoryBatchesTableTableAnnotationComposer,
      $$InventoryBatchesTableTableCreateCompanionBuilder,
      $$InventoryBatchesTableTableUpdateCompanionBuilder,
      (
        LocalInventoryBatch,
        BaseReferences<
          _$AppDatabase,
          $InventoryBatchesTableTable,
          LocalInventoryBatch
        >,
      ),
      LocalInventoryBatch,
      PrefetchHooks Function()
    >;
typedef $$QualityChecksTableTableCreateCompanionBuilder =
    QualityChecksTableCompanion Function({
      required String id,
      required String batchId,
      required String checkType,
      required String result,
      Value<String?> notes,
      Value<String?> checkedBy,
      Value<DateTime> checkedAt,
      Value<String> approvalStatus,
      Value<int> rowid,
    });
typedef $$QualityChecksTableTableUpdateCompanionBuilder =
    QualityChecksTableCompanion Function({
      Value<String> id,
      Value<String> batchId,
      Value<String> checkType,
      Value<String> result,
      Value<String?> notes,
      Value<String?> checkedBy,
      Value<DateTime> checkedAt,
      Value<String> approvalStatus,
      Value<int> rowid,
    });

class $$QualityChecksTableTableFilterComposer
    extends Composer<_$AppDatabase, $QualityChecksTableTable> {
  $$QualityChecksTableTableFilterComposer({
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

  ColumnFilters<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checkType => $composableBuilder(
    column: $table.checkType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checkedBy => $composableBuilder(
    column: $table.checkedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get checkedAt => $composableBuilder(
    column: $table.checkedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get approvalStatus => $composableBuilder(
    column: $table.approvalStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QualityChecksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $QualityChecksTableTable> {
  $$QualityChecksTableTableOrderingComposer({
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

  ColumnOrderings<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checkType => $composableBuilder(
    column: $table.checkType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checkedBy => $composableBuilder(
    column: $table.checkedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get checkedAt => $composableBuilder(
    column: $table.checkedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get approvalStatus => $composableBuilder(
    column: $table.approvalStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QualityChecksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $QualityChecksTableTable> {
  $$QualityChecksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get batchId =>
      $composableBuilder(column: $table.batchId, builder: (column) => column);

  GeneratedColumn<String> get checkType =>
      $composableBuilder(column: $table.checkType, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get checkedBy =>
      $composableBuilder(column: $table.checkedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get checkedAt =>
      $composableBuilder(column: $table.checkedAt, builder: (column) => column);

  GeneratedColumn<String> get approvalStatus => $composableBuilder(
    column: $table.approvalStatus,
    builder: (column) => column,
  );
}

class $$QualityChecksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QualityChecksTableTable,
          LocalQualityCheck,
          $$QualityChecksTableTableFilterComposer,
          $$QualityChecksTableTableOrderingComposer,
          $$QualityChecksTableTableAnnotationComposer,
          $$QualityChecksTableTableCreateCompanionBuilder,
          $$QualityChecksTableTableUpdateCompanionBuilder,
          (
            LocalQualityCheck,
            BaseReferences<
              _$AppDatabase,
              $QualityChecksTableTable,
              LocalQualityCheck
            >,
          ),
          LocalQualityCheck,
          PrefetchHooks Function()
        > {
  $$QualityChecksTableTableTableManager(
    _$AppDatabase db,
    $QualityChecksTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QualityChecksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QualityChecksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QualityChecksTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> batchId = const Value.absent(),
                Value<String> checkType = const Value.absent(),
                Value<String> result = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> checkedBy = const Value.absent(),
                Value<DateTime> checkedAt = const Value.absent(),
                Value<String> approvalStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QualityChecksTableCompanion(
                id: id,
                batchId: batchId,
                checkType: checkType,
                result: result,
                notes: notes,
                checkedBy: checkedBy,
                checkedAt: checkedAt,
                approvalStatus: approvalStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String batchId,
                required String checkType,
                required String result,
                Value<String?> notes = const Value.absent(),
                Value<String?> checkedBy = const Value.absent(),
                Value<DateTime> checkedAt = const Value.absent(),
                Value<String> approvalStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QualityChecksTableCompanion.insert(
                id: id,
                batchId: batchId,
                checkType: checkType,
                result: result,
                notes: notes,
                checkedBy: checkedBy,
                checkedAt: checkedAt,
                approvalStatus: approvalStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QualityChecksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QualityChecksTableTable,
      LocalQualityCheck,
      $$QualityChecksTableTableFilterComposer,
      $$QualityChecksTableTableOrderingComposer,
      $$QualityChecksTableTableAnnotationComposer,
      $$QualityChecksTableTableCreateCompanionBuilder,
      $$QualityChecksTableTableUpdateCompanionBuilder,
      (
        LocalQualityCheck,
        BaseReferences<
          _$AppDatabase,
          $QualityChecksTableTable,
          LocalQualityCheck
        >,
      ),
      LocalQualityCheck,
      PrefetchHooks Function()
    >;
typedef $$MarketListingsTableTableCreateCompanionBuilder =
    MarketListingsTableCompanion Function({
      required String id,
      required String farmId,
      Value<String?> productId,
      required String publicTitle,
      Value<String?> publicDescription,
      required String sellingUnit,
      Value<int> unitConversion,
      required int priceInMinorUnits,
      Value<String> currency,
      Value<int> minimumOrderQuantity,
      Value<String> status,
      Value<String> approvalStatus,
      Value<int> rowid,
    });
typedef $$MarketListingsTableTableUpdateCompanionBuilder =
    MarketListingsTableCompanion Function({
      Value<String> id,
      Value<String> farmId,
      Value<String?> productId,
      Value<String> publicTitle,
      Value<String?> publicDescription,
      Value<String> sellingUnit,
      Value<int> unitConversion,
      Value<int> priceInMinorUnits,
      Value<String> currency,
      Value<int> minimumOrderQuantity,
      Value<String> status,
      Value<String> approvalStatus,
      Value<int> rowid,
    });

class $$MarketListingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MarketListingsTableTable> {
  $$MarketListingsTableTableFilterComposer({
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

  ColumnFilters<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publicTitle => $composableBuilder(
    column: $table.publicTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publicDescription => $composableBuilder(
    column: $table.publicDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sellingUnit => $composableBuilder(
    column: $table.sellingUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitConversion => $composableBuilder(
    column: $table.unitConversion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priceInMinorUnits => $composableBuilder(
    column: $table.priceInMinorUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minimumOrderQuantity => $composableBuilder(
    column: $table.minimumOrderQuantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get approvalStatus => $composableBuilder(
    column: $table.approvalStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MarketListingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MarketListingsTableTable> {
  $$MarketListingsTableTableOrderingComposer({
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

  ColumnOrderings<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publicTitle => $composableBuilder(
    column: $table.publicTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publicDescription => $composableBuilder(
    column: $table.publicDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sellingUnit => $composableBuilder(
    column: $table.sellingUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitConversion => $composableBuilder(
    column: $table.unitConversion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priceInMinorUnits => $composableBuilder(
    column: $table.priceInMinorUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minimumOrderQuantity => $composableBuilder(
    column: $table.minimumOrderQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get approvalStatus => $composableBuilder(
    column: $table.approvalStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MarketListingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MarketListingsTableTable> {
  $$MarketListingsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get publicTitle => $composableBuilder(
    column: $table.publicTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get publicDescription => $composableBuilder(
    column: $table.publicDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sellingUnit => $composableBuilder(
    column: $table.sellingUnit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unitConversion => $composableBuilder(
    column: $table.unitConversion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get priceInMinorUnits => $composableBuilder(
    column: $table.priceInMinorUnits,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<int> get minimumOrderQuantity => $composableBuilder(
    column: $table.minimumOrderQuantity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get approvalStatus => $composableBuilder(
    column: $table.approvalStatus,
    builder: (column) => column,
  );
}

class $$MarketListingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MarketListingsTableTable,
          LocalMarketListing,
          $$MarketListingsTableTableFilterComposer,
          $$MarketListingsTableTableOrderingComposer,
          $$MarketListingsTableTableAnnotationComposer,
          $$MarketListingsTableTableCreateCompanionBuilder,
          $$MarketListingsTableTableUpdateCompanionBuilder,
          (
            LocalMarketListing,
            BaseReferences<
              _$AppDatabase,
              $MarketListingsTableTable,
              LocalMarketListing
            >,
          ),
          LocalMarketListing,
          PrefetchHooks Function()
        > {
  $$MarketListingsTableTableTableManager(
    _$AppDatabase db,
    $MarketListingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MarketListingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MarketListingsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MarketListingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> farmId = const Value.absent(),
                Value<String?> productId = const Value.absent(),
                Value<String> publicTitle = const Value.absent(),
                Value<String?> publicDescription = const Value.absent(),
                Value<String> sellingUnit = const Value.absent(),
                Value<int> unitConversion = const Value.absent(),
                Value<int> priceInMinorUnits = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<int> minimumOrderQuantity = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> approvalStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MarketListingsTableCompanion(
                id: id,
                farmId: farmId,
                productId: productId,
                publicTitle: publicTitle,
                publicDescription: publicDescription,
                sellingUnit: sellingUnit,
                unitConversion: unitConversion,
                priceInMinorUnits: priceInMinorUnits,
                currency: currency,
                minimumOrderQuantity: minimumOrderQuantity,
                status: status,
                approvalStatus: approvalStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String farmId,
                Value<String?> productId = const Value.absent(),
                required String publicTitle,
                Value<String?> publicDescription = const Value.absent(),
                required String sellingUnit,
                Value<int> unitConversion = const Value.absent(),
                required int priceInMinorUnits,
                Value<String> currency = const Value.absent(),
                Value<int> minimumOrderQuantity = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> approvalStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MarketListingsTableCompanion.insert(
                id: id,
                farmId: farmId,
                productId: productId,
                publicTitle: publicTitle,
                publicDescription: publicDescription,
                sellingUnit: sellingUnit,
                unitConversion: unitConversion,
                priceInMinorUnits: priceInMinorUnits,
                currency: currency,
                minimumOrderQuantity: minimumOrderQuantity,
                status: status,
                approvalStatus: approvalStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MarketListingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MarketListingsTableTable,
      LocalMarketListing,
      $$MarketListingsTableTableFilterComposer,
      $$MarketListingsTableTableOrderingComposer,
      $$MarketListingsTableTableAnnotationComposer,
      $$MarketListingsTableTableCreateCompanionBuilder,
      $$MarketListingsTableTableUpdateCompanionBuilder,
      (
        LocalMarketListing,
        BaseReferences<
          _$AppDatabase,
          $MarketListingsTableTable,
          LocalMarketListing
        >,
      ),
      LocalMarketListing,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AnimalsTableTableTableManager get animalsTable =>
      $$AnimalsTableTableTableManager(_db, _db.animalsTable);
  $$MilkRecordsTableTableTableManager get milkRecordsTable =>
      $$MilkRecordsTableTableTableManager(_db, _db.milkRecordsTable);
  $$SyncOutboxTableTableTableManager get syncOutboxTable =>
      $$SyncOutboxTableTableTableManager(_db, _db.syncOutboxTable);
  $$FeedTypesTableTableTableManager get feedTypesTable =>
      $$FeedTypesTableTableTableManager(_db, _db.feedTypesTable);
  $$FeedRecordsTableTableTableManager get feedRecordsTable =>
      $$FeedRecordsTableTableTableManager(_db, _db.feedRecordsTable);
  $$EggRecordsTableTableTableManager get eggRecordsTable =>
      $$EggRecordsTableTableTableManager(_db, _db.eggRecordsTable);
  $$FlocksTableTableTableManager get flocksTable =>
      $$FlocksTableTableTableManager(_db, _db.flocksTable);
  $$EggProductionRecordsTableTableTableManager get eggProductionRecordsTable =>
      $$EggProductionRecordsTableTableTableManager(
        _db,
        _db.eggProductionRecordsTable,
      );
  $$FlockAdjustmentsTableTableTableManager get flockAdjustmentsTable =>
      $$FlockAdjustmentsTableTableTableManager(_db, _db.flockAdjustmentsTable);
  $$FarmMarketProfilesTableTableTableManager get farmMarketProfilesTable =>
      $$FarmMarketProfilesTableTableTableManager(
        _db,
        _db.farmMarketProfilesTable,
      );
  $$MarketProductsTableTableTableManager get marketProductsTable =>
      $$MarketProductsTableTableTableManager(_db, _db.marketProductsTable);
  $$InventoryBatchesTableTableTableManager get inventoryBatchesTable =>
      $$InventoryBatchesTableTableTableManager(_db, _db.inventoryBatchesTable);
  $$QualityChecksTableTableTableManager get qualityChecksTable =>
      $$QualityChecksTableTableTableManager(_db, _db.qualityChecksTable);
  $$MarketListingsTableTableTableManager get marketListingsTable =>
      $$MarketListingsTableTableTableManager(_db, _db.marketListingsTable);
}
