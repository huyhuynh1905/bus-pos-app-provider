// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_scheduler_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftSchedulerEntity _$ShiftSchedulerEntityFromJson(
        Map<String, dynamic> json) =>
    ShiftSchedulerEntity(
      (json['localId'] as num?)?.toInt(),
      (json['id'] as num?)?.toInt(),
      json['carId'] as String?,
      json['driverLicense'] as String?,
      (json['goBack'] as num?)?.toInt(),
      (json['routeId'] as num?)?.toInt(),
      json['scheduleId'] as String?,
      json['routeCode'] as String?,
      json['scheduleTime'] as String?,
      json['sellerIdCard'] as String?,
      json['node'] as String?,
    );

Map<String, dynamic> _$ShiftSchedulerEntityToJson(
        ShiftSchedulerEntity instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'carId': instance.carId,
      'driverLicense': instance.driverLicense,
      'goBack': instance.goBack,
      'routeId': instance.routeId,
      'scheduleId': instance.scheduleId,
      'routeCode': instance.routeCode,
      'scheduleTime': instance.scheduleTime,
      'sellerIdCard': instance.sellerIdCard,
      'node': instance.node,
    };
