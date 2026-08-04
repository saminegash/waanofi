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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    operation,
    payload,
    createdAt,
    status,
    errorMessage,
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
  const SyncOutboxItem({
    required this.id,
    required this.entityType,
    required this.operation,
    required this.payload,
    required this.createdAt,
    required this.status,
    this.errorMessage,
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
  }) => SyncOutboxItem(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    operation: operation ?? this.operation,
    payload: payload ?? this.payload,
    createdAt: createdAt ?? this.createdAt,
    status: status ?? this.status,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
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
          ..write('errorMessage: $errorMessage')
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
          other.errorMessage == this.errorMessage);
}

class SyncOutboxTableCompanion extends UpdateCompanion<SyncOutboxItem> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> operation;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<String> status;
  final Value<String?> errorMessage;
  const SyncOutboxTableCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.errorMessage = const Value.absent(),
  });
  SyncOutboxTableCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String operation,
    required String payload,
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.errorMessage = const Value.absent(),
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
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (status != null) 'status': status,
      if (errorMessage != null) 'error_message': errorMessage,
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
  }) {
    return SyncOutboxTableCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
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
          ..write('errorMessage: $errorMessage')
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
  late final AnimalsDao animalsDao = AnimalsDao(this as AppDatabase);
  late final EggRecordsDao eggRecordsDao = EggRecordsDao(this as AppDatabase);
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
              }) => SyncOutboxTableCompanion(
                id: id,
                entityType: entityType,
                operation: operation,
                payload: payload,
                createdAt: createdAt,
                status: status,
                errorMessage: errorMessage,
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
              }) => SyncOutboxTableCompanion.insert(
                id: id,
                entityType: entityType,
                operation: operation,
                payload: payload,
                createdAt: createdAt,
                status: status,
                errorMessage: errorMessage,
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
}
