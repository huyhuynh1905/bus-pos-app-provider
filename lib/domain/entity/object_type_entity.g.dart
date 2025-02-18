// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_type_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectTypeEntity _$ObjectTypeEntityFromJson(Map<String, dynamic> json) =>
    ObjectTypeEntity(
      settingType: json['settingType'] as String?,
      settingKey: json['settingKey'] as String?,
      settingValue: json['settingValue'] as String?,
      description: json['description'] as String?,
      companyId: (json['companyId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ObjectTypeEntityToJson(ObjectTypeEntity instance) =>
    <String, dynamic>{
      'settingType': instance.settingType,
      'settingKey': instance.settingKey,
      'settingValue': instance.settingValue,
      'description': instance.description,
      'companyId': instance.companyId,
      'id': instance.id,
      'totalCount': instance.totalCount,
    };
