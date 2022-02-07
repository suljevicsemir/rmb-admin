

import 'package:json_annotation/json_annotation.dart';

part 'branch_type.g.dart';

@JsonSerializable()
class BranchType {

  BranchType({
    required this.name,
    this.id
  });

  factory BranchType.fromJson(Map<String, dynamic> json) => _$BranchTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BranchTypeToJson(this);

  @JsonKey(includeIfNull: false)
  String? id;
  String name;


}