// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchType _$BranchTypeFromJson(Map<String, dynamic> json) => BranchType(
      name: json['name'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BranchTypeToJson(BranchType instance) {
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
