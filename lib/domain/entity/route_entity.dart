import 'package:json_annotation/json_annotation.dart';

part 'route_entity.g.dart';

@JsonSerializable()
class RouteEntity {

  String? providerId;
  String? nameZh;
  String? dDesc;
  String? departureZh;
  String? destinationZh;
  String? gxCode;
  String? routeMapImageUrl;
  String? timeScheduleUrlWeight;
  String? opType;
  String? code;
  String? cyberRouteId;
  int? id;
  int? totalCount;

  RouteEntity({
    this.providerId,
    this.nameZh,
    this.dDesc,
    this.departureZh,
    this.destinationZh,
    this.gxCode,
    this.routeMapImageUrl,
    this.timeScheduleUrlWeight,
    this.opType,
    this.code,
    this.cyberRouteId,
    this.id,
    this.totalCount,
  });

  factory RouteEntity.fromJson(Map<String, dynamic> json) => _$RouteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RouteEntityToJson(this);
}
