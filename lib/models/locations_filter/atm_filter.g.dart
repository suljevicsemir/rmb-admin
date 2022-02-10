// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atm_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ATMFilter _$ATMFilterFromJson(Map<String, dynamic> json) => ATMFilter(
      name: json['name'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ATMFilterToJson(ATMFilter instance) {
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
