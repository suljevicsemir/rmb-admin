

import 'package:json_annotation/json_annotation.dart';

part 'credentials_pair.g.dart';

@JsonSerializable()
class CredentialsPair {

  const CredentialsPair({required this.password, required this.email});

  factory CredentialsPair.fromJson(Map<String, dynamic> json) => _$CredentialsPairFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialsPairToJson(this);

  final String email;
  final String password;
}