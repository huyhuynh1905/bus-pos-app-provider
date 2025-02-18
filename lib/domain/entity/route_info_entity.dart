import 'package:bus_pos_app/domain/entity/bus_stop_entity.dart';
import 'package:bus_pos_app/domain/entity/route_entity.dart';
import 'package:bus_pos_app/domain/entity/sumary_schedule_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_info_entity.g.dart';

@JsonSerializable()
class RouteInfoEntity {

  RouteEntity? route;
  List<BusStopEntity>? busStops;
  List<SummaryScheduleEntity> summarySchedules;

  RouteInfoEntity({
    required this.route,
    required this.busStops,
    required this.summarySchedules,
  });

  factory RouteInfoEntity.fromJson(Map<String, dynamic> json) => _$RouteInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RouteInfoEntityToJson(this);
}
