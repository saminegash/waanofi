import 'package:freezed_annotation/freezed_annotation.dart';

enum AnimalLifecycleStatus {
  @JsonValue('active')
  active,
  @JsonValue('sold')
  sold,
  @JsonValue('transferred_out')
  transferredOut,
  @JsonValue('deceased')
  deceased,
  @JsonValue('culled')
  culled,
  @JsonValue('missing')
  missing,
  @JsonValue('unknown')
  unknown,
}

enum AnimalReproductiveStatus {
  @JsonValue('not_applicable')
  notApplicable,
  @JsonValue('unknown')
  unknown,
  @JsonValue('open')
  open,
  @JsonValue('heat')
  heat,
  @JsonValue('served')
  served,
  @JsonValue('pregnant')
  pregnant,
  @JsonValue('postpartum')
  postpartum,
}

enum AnimalLactationStatus {
  @JsonValue('not_applicable')
  notApplicable,
  @JsonValue('unknown')
  unknown,
  @JsonValue('lactating')
  lactating,
  @JsonValue('dry')
  dry,
}

enum AnimalHealthStatus {
  @JsonValue('healthy')
  healthy,
  @JsonValue('sick')
  sick,
  @JsonValue('under_treatment')
  underTreatment,
  @JsonValue('quarantined')
  quarantined,
  @JsonValue('recovering')
  recovering,
  @JsonValue('unknown')
  unknown,
}

enum CattleClass {
  @JsonValue('calf')
  calf,
  @JsonValue('heifer')
  heifer,
  @JsonValue('cow')
  cow,
  @JsonValue('bull')
  bull,
  @JsonValue('steer')
  steer,
  @JsonValue('unknown')
  unknown,
}

enum AnimalStateDimension {
  @JsonValue('lifecycle')
  lifecycle,
  @JsonValue('reproduction')
  reproduction,
  @JsonValue('lactation')
  lactation,
  @JsonValue('health')
  health,
  @JsonValue('cattle_class')
  cattleClass,
  @JsonValue('location')
  location,
}
