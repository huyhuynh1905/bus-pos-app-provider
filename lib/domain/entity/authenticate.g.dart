// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authenticate _$AuthenticateFromJson(Map<String, dynamic> json) => Authenticate(
      json['accessToken'] as String?,
      json['refreshToken'] as String?,
      json['expired'] as String?,
      json['tokenType'] as String?,
    );

Map<String, dynamic> _$AuthenticateToJson(Authenticate instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expired': instance.expired,
      'tokenType': instance.tokenType,
    };
