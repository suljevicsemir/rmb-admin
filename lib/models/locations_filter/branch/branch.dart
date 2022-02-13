
import 'package:json_annotation/json_annotation.dart';
import 'package:rmb_admin/models/city.dart';
import 'package:rmb_admin/models/locations_filter/atm_filter.dart';
import 'package:rmb_admin/models/locations_filter/branch_service_type.dart';
import 'package:rmb_admin/models/locations_filter/branch_type.dart';
import 'package:rmb_admin/models/locations_filter/location.dart';
import 'package:rmb_admin/models/locations_filter/working_hours.dart';

part 'branch.g.dart';

@JsonSerializable()
class Branch {

  Branch({
    this.id,
    required this.atmFilter,
    required this.branchServiceType,
    required this.branchType,
    required this.city,
    required this.location,
    required this.name,
    required this.atmType,
    required this.contact,
    required this.workingHours,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);


  @JsonKey(includeIfNull: false)
  String? id;
  Location location;
  String name;
  @JsonKey()
  City city;
  String contact;
  @JsonKey(defaultValue: <WorkingHours>[])
  List<WorkingHours> workingHours;
  @JsonKey()
  BranchType branchType;
  @JsonKey()
  BranchServiceType branchServiceType;
  String atmType;
  @JsonKey()
  ATMFilter atmFilter;


}