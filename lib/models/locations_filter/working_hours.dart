

import 'package:json_annotation/json_annotation.dart';

part 'working_hours.g.dart';

@JsonSerializable()
class WorkingHours {

  WorkingHours({
    this.day,
    this.id
  });

  factory WorkingHours.fromJson(Map<String, dynamic> json) => _$WorkingHoursFromJson(json);

  Map<String, dynamic> toJson() => _$WorkingHoursToJson(this);

  String? id;
  String? day;
}