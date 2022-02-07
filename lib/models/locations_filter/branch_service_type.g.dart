// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_service_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchServiceType _$BranchServiceTypeFromJson(Map<String, dynamic> json) =>
    BranchServiceType(
      name: json['name'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BranchServiceTypeToJson(BranchServiceType instance) {
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
