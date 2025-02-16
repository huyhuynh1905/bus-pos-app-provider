// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseList _$BaseResponseListFromJson(Map<String, dynamic> json) =>
    BaseResponseList(
      json['success'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['typeCard'] as String?,
    );

Map<String, dynamic> _$BaseResponseListToJson(BaseResponseList instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'messages': instance.errors,
      'typeCard': instance.typeCard,
    };
