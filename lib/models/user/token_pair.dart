
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_pair.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class TokenPair extends HiveObject{

  TokenPair({required this.refreshToken, required this.accessToken});

  factory TokenPair.fromJson(Map<String, dynamic> json) => _$TokenPairFromJson(json);

  Map<String, dynamic> toJson() => _$TokenPairToJson(this);

  @HiveField(0)
  final String? accessToken;
  @HiveField(1)
  final String? refreshToken;

}