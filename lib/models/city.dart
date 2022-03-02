
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {

  City({required this.name, this.id});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  @JsonKey(includeIfNull: false)
  String? id;
  String name;

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }

  @override
  bool operator ==(dynamic other) =>
      other != null && other is City && id == other.id;

  @override
  int get hashCode => super.hashCode;
}