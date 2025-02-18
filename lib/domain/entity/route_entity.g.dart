// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteEntity _$RouteEntityFromJson(Map<String, dynamic> json) => RouteEntity(
      providerId: json['providerId'] as String?,
      nameZh: json['nameZh'] as String?,
      dDesc: json['dDesc'] as String?,
      departureZh: json['departureZh'] as String?,
      destinationZh: json['destinationZh'] as String?,
      gxCode: json['gxCode'] as String?,
      routeMapImageUrl: json['routeMapImageUrl'] as String?,
      timeScheduleUrlWeight: json['timeScheduleUrlWeight'] as String?,
      opType: json['opType'] as String?,
      code: json['code'] as String?,
      cyberRouteId: json['cyberRouteId'] as String?,
      id: (json['id'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RouteEntityToJson(RouteEntity instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'nameZh': instance.nameZh,
      'dDesc': instance.dDesc,
      'departureZh': instance.departureZh,
      'destinationZh': instance.destinationZh,
      'gxCode': instance.gxCode,
      'routeMapImageUrl': instance.routeMapImageUrl,
      'timeScheduleUrlWeight': instance.timeScheduleUrlWeight,
      'opType': instance.opType,
      'code': instance.code,
      'cyberRouteId': instance.cyberRouteId,
      'id': instance.id,
      'totalCount': instance.totalCount,
    };
