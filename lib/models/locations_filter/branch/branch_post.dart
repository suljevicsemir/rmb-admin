

import 'package:json_annotation/json_annotation.dart';
import 'package:rmb_admin/models/locations_filter/location.dart';
import 'package:rmb_admin/models/locations_filter/working_hours.dart';

part 'branch_post.g.dart';

@JsonSerializable()
class BranchPost {

  BranchPost({
    this.id,
    required this.atmFilterId,
    required this.branchServiceTypeId,
    required this.branchTypeId,
    required this.cityId,
    required this.location,
    required this.name,
    required this.atmType,
    required this.contact,
    required this.workingHours,
  });

  factory BranchPost.fromJson(Map<String, dynamic> json) => _$BranchPostFromJson(json);

  Map<String, dynamic> toJson() => _$BranchPostToJson(this);


  @JsonKey(includeIfNull: false)
  String? id;
  Location location;
  String name;
  @JsonKey()
  String cityId;
  String contact;
  List<WorkingHours> workingHours;
  @JsonKey()
  String branchTypeId;
  @JsonKey()
  String branchServiceTypeId;
  String atmType;
  @JsonKey()
  String atmFilterId;


}