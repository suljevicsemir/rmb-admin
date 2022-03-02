
import 'package:json_annotation/json_annotation.dart';
import 'package:rmb_admin/models/locations_filter/location_filter.dart';

part 'branch_service_type.g.dart';

@JsonSerializable()
class BranchServiceType extends LocationFilter{

  BranchServiceType({
    required String name,
    String? id
  }): super(
    name: name,
    id: id
  );

  factory BranchServiceType.fromJson(Map<String, dynamic> json) => _$BranchServiceTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BranchServiceTypeToJson(this);

  @override
  String toString() {
    return 'BranchServiceType{id: $id, name: $id}';
  }

  @override
  bool operator ==(dynamic other) =>
      other != null && other is BranchServiceType && id == other.id;

  @override
  int get hashCode => super.hashCode;


}