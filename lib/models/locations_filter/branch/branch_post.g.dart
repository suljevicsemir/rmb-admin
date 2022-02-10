// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchPost _$BranchPostFromJson(Map<String, dynamic> json) => BranchPost(
      id: json['id'] as String?,
      atmFilterId: json['atmFilterId'] as String,
      branchServiceTypeId: json['branchServiceTypeId'] as String,
      branchTypeId: json['branchTypeId'] as String,
      cityId: json['cityId'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      name: json['name'] as String,
      atmType: json['atmType'] as String,
      contact: json['contact'] as String,
      workingHours: (json['workingHours'] as List<dynamic>)
          .map((e) => WorkingHours.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BranchPostToJson(BranchPost instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['location'] = instance.location;
  val['name'] = instance.name;
  val['cityId'] = instance.cityId;
  val['contact'] = instance.contact;
  val['workingHours'] = instance.workingHours;
  val['branchTypeId'] = instance.branchTypeId;
  val['branchServiceTypeId'] = instance.branchServiceTypeId;
  val['atmType'] = instance.atmType;
  val['atmFilterId'] = instance.atmFilterId;
  return val;
}
