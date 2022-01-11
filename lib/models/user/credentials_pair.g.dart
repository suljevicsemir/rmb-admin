// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialsPair _$CredentialsPairFromJson(Map<String, dynamic> json) =>
    CredentialsPair(
      password: json['password'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$CredentialsPairToJson(CredentialsPair instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
