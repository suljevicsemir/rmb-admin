

import 'package:json_annotation/json_annotation.dart';

part 'branch_service_type.g.dart';

@JsonSerializable()
class BranchServiceType {

  BranchServiceType({
    required this.name,
    this.id
  });

  factory BranchServiceType.fromJson(Map<String, dynamic> json) => _$BranchServiceTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BranchServiceTypeToJson(this);

  @JsonKey(includeIfNull: false)
  String? id;
  String name;


}