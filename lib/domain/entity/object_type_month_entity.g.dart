// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_type_month_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectTypeMonthEntity _$ObjectTypeMonthEntityFromJson(
        Map<String, dynamic> json) =>
    ObjectTypeMonthEntity(
      settingType: json['settingType'] as String?,
      settingKey: json['settingKey'] as String?,
      settingValue: json['settingValue'] as String?,
      description: json['description'] as String?,
      companyId: (json['companyId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ObjectTypeMonthEntityToJson(
        ObjectTypeMonthEntity instance) =>
    <String, dynamic>{
      'settingType': instance.settingType,
      'settingKey': instance.settingKey,
      'settingValue': instance.settingValue,
      'description': instance.description,
      'companyId': instance.companyId,
      'id': instance.id,
    };
