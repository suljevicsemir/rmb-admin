// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationFilter _$LocationFilterFromJson(Map<String, dynamic> json) =>
    LocationFilter(
      name: json['name'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LocationFilterToJson(LocationFilter instance) {
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
