
import 'package:json_annotation/json_annotation.dart';

part 'token_pair.g.dart';

@JsonSerializable()
class TokenPair {

  const TokenPair({required this.refreshToken, required this.accessToken});

  factory TokenPair.fromJson(Map<String, dynamic> json) => _$TokenPairFromJson(json);

  Map<String, dynamic> toJson() => _$TokenPairToJson(this);

  final String accessToken;
  final String refreshToken;

}