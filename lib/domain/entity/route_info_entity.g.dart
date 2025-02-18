// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteInfoEntity _$RouteInfoEntityFromJson(Map<String, dynamic> json) =>
    RouteInfoEntity(
      route: json['route'] == null
          ? null
          : RouteEntity.fromJson(json['route'] as Map<String, dynamic>),
      busStops: (json['busStops'] as List<dynamic>?)
          ?.map((e) => BusStopEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      summarySchedules: (json['summarySchedules'] as List<dynamic>)
          .map((e) => SummaryScheduleEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RouteInfoEntityToJson(RouteInfoEntity instance) =>
    <String, dynamic>{
      'route': instance.route,
      'busStops': instance.busStops,
      'summarySchedules': instance.summarySchedules,
    };
