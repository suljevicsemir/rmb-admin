

import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';


@JsonSerializable()
class Location {

  Location({
    required this.address,
    required this.latitude,
    required this.longitude,
    this.id
  });
  
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);



  @JsonKey(includeIfNull: false)
  String? id;
  String address;
  double latitude;
  double longitude;


}