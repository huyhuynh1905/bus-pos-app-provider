// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sumary_schedule_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryScheduleEntity _$SummaryScheduleEntityFromJson(
        Map<String, dynamic> json) =>
    SummaryScheduleEntity(
      ticketId: (json['ticketId'] as num?)?.toInt(),
      routeId: (json['routeId'] as num?)?.toInt(),
      scheduleId: json['scheduleId'] as String?,
      serialTo: (json['serialTo'] as num?)?.toInt(),
      totalAmount: (json['totalAmount'] as num?)?.toInt(),
      totalQuantity: (json['totalQuantity'] as num?)?.toInt(),
      goBack: (json['goBack'] as num?)?.toInt(),
      carId: json['carId'] as String?,
      driverLicense: json['driverLicense'] as String?,
      scheduleTime: json['scheduleTime'] == null
          ? null
          : DateTime.parse(json['scheduleTime'] as String),
      node: json['node'] as String?,
      sellerIdCard: json['sellerIdCard'] as String?,
      isSync: (json['isSync'] as num?)?.toInt(),
      syncDate: json['syncDate'] == null
          ? null
          : DateTime.parse(json['syncDate'] as String),
      shiftSchedulerId: (json['shiftSchedulerId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SummaryScheduleEntityToJson(
        SummaryScheduleEntity instance) =>
    <String, dynamic>{
      'ticketId': instance.ticketId,
      'routeId': instance.routeId,
      'scheduleId': instance.scheduleId,
      'serialTo': instance.serialTo,
      'totalAmount': instance.totalAmount,
      'totalQuantity': instance.totalQuantity,
      'goBack': instance.goBack,
      'carId': instance.carId,
      'driverLicense': instance.driverLicense,
      'scheduleTime': instance.scheduleTime?.toIso8601String(),
      'node': instance.node,
      'sellerIdCard': instance.sellerIdCard,
      'isSync': instance.isSync,
      'syncDate': instance.syncDate?.toIso8601String(),
      'shiftSchedulerId': instance.shiftSchedulerId,
      'id': instance.id,
      'totalCount': instance.totalCount,
    };
