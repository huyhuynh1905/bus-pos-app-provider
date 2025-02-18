// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketProductEntity _$TicketProductEntityFromJson(Map<String, dynamic> json) =>
    TicketProductEntity(
      name: json['name'] as String?,
      code: json['code'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      serialFormat: json['serialFormat'] as String?,
      routeId: (json['routeId'] as num?)?.toInt(),
      description: json['description'] as String?,
      type: json['type'] as String?,
      isActive: (json['isActive'] as num?)?.toInt(),
      temThangType: json['temThangType'] as String?,
      objectType: json['objectType'] as String?,
      isMultiRoutes: json['isMultiRoutes'] as bool?,
      id: (json['id'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TicketProductEntityToJson(
        TicketProductEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'amount': instance.amount,
      'serialFormat': instance.serialFormat,
      'routeId': instance.routeId,
      'description': instance.description,
      'type': instance.type,
      'isActive': instance.isActive,
      'temThangType': instance.temThangType,
      'objectType': instance.objectType,
      'isMultiRoutes': instance.isMultiRoutes,
      'id': instance.id,
      'totalCount': instance.totalCount,
    };
