// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atm_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ATMService _$ATMServiceFromJson(Map<String, dynamic> json) => ATMService(
      name: json['name'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ATMServiceToJson(ATMService instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  return val;
}
