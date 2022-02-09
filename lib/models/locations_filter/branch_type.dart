

import 'package:json_annotation/json_annotation.dart';
import 'package:rmb_admin/models/locations_filter/location_filter.dart';

part 'branch_type.g.dart';

@JsonSerializable()
class BranchType extends LocationFilter{

  BranchType({
    required String name,
    String? id
  }): super(
    name: name,
    id: id
  );

  factory BranchType.fromJson(Map<String, dynamic> json) => _$BranchTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BranchTypeToJson(this);
}