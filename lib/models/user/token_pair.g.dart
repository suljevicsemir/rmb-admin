// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenPair _$TokenPairFromJson(Map<String, dynamic> json) => TokenPair(
      refreshToken: json['refreshToken'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$TokenPairToJson(TokenPair instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
