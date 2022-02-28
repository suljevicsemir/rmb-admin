// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      id: json['id'] as String?,
      atmFilter: ATMFilter.fromJson(json['atmFilter'] as Map<String, dynamic>),
      branchServiceType: BranchServiceType.fromJson(
          json['branchServiceType'] as Map<String, dynamic>),
      branchType:
          BranchType.fromJson(json['branchType'] as Map<String, dynamic>),
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      name: json['name'] as String,
      atmType: json['atmType'] as String,
      contact: json['contact'] as String,
      workingHours: (json['workingHours'] as List<dynamic>?)
              ?.map((e) => WorkingHours.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BranchToJson(Branch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['location'] = instance.location;
  val['name'] = instance.name;
  val['city'] = instance.city;
  val['contact'] = instance.contact;
  val['workingHours'] = instance.workingHours;
  val['branchType'] = instance.branchType;
  val['branchServiceType'] = instance.branchServiceType;
  val['atmType'] = instance.atmType;
  val['atmFilter'] = instance.atmFilter;
  return val;
}
