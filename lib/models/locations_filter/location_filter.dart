
import 'package:json_annotation/json_annotation.dart';

part 'location_filter.g.dart';

@JsonSerializable()
class LocationFilter {

  LocationFilter({
    required this.name,
    this.id
  });

  @JsonKey(includeIfNull: false)
  String? id;
  String name;
}