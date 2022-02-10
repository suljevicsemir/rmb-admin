
import 'package:json_annotation/json_annotation.dart';
import 'package:rmb_admin/models/locations_filter/location_filter.dart';

part 'atm_filter.g.dart';

@JsonSerializable()
class ATMFilter extends LocationFilter{

  ATMFilter({
    required String name,
    String? id
  }): super(
    name: name,
    id: id
  );

  factory ATMFilter.fromJson(Map<String, dynamic> json) => _$ATMFilterFromJson(json);

  Map<String, dynamic> toJson() => _$ATMFilterToJson(this);


}