
import 'package:json_annotation/json_annotation.dart';
import 'package:rmb_admin/models/locations_filter/location_filter.dart';

part 'atm_service.g.dart';

@JsonSerializable()
class ATMService extends LocationFilter{

  ATMService({
    required String name,
    String? id
  }): super(
    name: name,
    id: id
  );

  factory ATMService.fromJson(Map<String, dynamic> json) => _$ATMServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ATMServiceToJson(this);


}