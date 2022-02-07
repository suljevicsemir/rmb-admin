
import 'package:json_annotation/json_annotation.dart';

part 'atm_service.g.dart';

@JsonSerializable()
class ATMService {

  ATMService({
    required this.name,
    this.id
  });

  factory ATMService.fromJson(Map<String, dynamic> json) => _$ATMServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ATMServiceToJson(this);


  String? id;
  String name;
}