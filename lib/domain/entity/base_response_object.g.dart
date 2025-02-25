// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseObj _$BaseResponseObjFromJson(Map<String, dynamic> json) =>
    BaseResponseObj(
      json['success'] as bool?,
      json['data'] as Map<String, dynamic>?,
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['typeCard'] as String?,
    );

Map<String, dynamic> _$BaseResponseObjToJson(BaseResponseObj instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'messages': instance.errors,
      'typeCard': instance.typeCard,
    };
