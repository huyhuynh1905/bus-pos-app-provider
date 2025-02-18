import 'package:json_annotation/json_annotation.dart';

part 'bus_stop_entity.g.dart';

@JsonSerializable()
class BusStopEntity {

  int? routeId;
  String? nameZh;
  int? seqNo;
  String? pgp;
  String? terminal;
  String? districtId;
  int? goBack;
  double? latitude;
  double? longitude;
  String? extVoiceNo;
  int? sid;
  int? ivrNo;
  int? id;
  int? totalCount;

  BusStopEntity({
    this.routeId,
    this.nameZh,
    this.seqNo,
    this.pgp,
    this.terminal,
    this.districtId,
    this.goBack,
    this.latitude,
    this.longitude,
    this.extVoiceNo,
    this.sid,
    this.ivrNo,
    this.id,
    this.totalCount,
  });

  factory BusStopEntity.fromJson(Map<String, dynamic> json) => _$BusStopEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BusStopEntityToJson(this);
}
