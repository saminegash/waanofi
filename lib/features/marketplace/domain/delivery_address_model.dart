// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/date_formatter.dart';

part 'delivery_address_model.freezed.dart';
part 'delivery_address_model.g.dart';

@freezed
class DeliveryAddressModel with _$DeliveryAddressModel {
  const factory DeliveryAddressModel({
    required String id,
    @JsonKey(name: 'buyer_id') required String buyerId,
    @Default('Primary') String label,
    @JsonKey(name: 'recipient_name') required String recipientName,
    required String phone,
    required String region,
    required String city,
    @JsonKey(name: 'sub_city') required String subCity,
    required String neighborhood,
    required String landmark,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
    @JsonKey(name: 'is_default') @Default(false) bool isDefault,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime updatedAt,
  }) = _DeliveryAddressModel;

  factory DeliveryAddressModel.fromJson(Map<String, dynamic> json) => _$DeliveryAddressModelFromJson(json);
}

extension DeliveryAddressFormatting on DeliveryAddressModel {
  String get fullAddressDisplay => '$neighborhood, $subCity, $city ($landmark)';
  bool get hasCoordinates => latitude != null && longitude != null;
}
