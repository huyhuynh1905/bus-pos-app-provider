// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_stop_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusStopEntity _$BusStopEntityFromJson(Map<String, dynamic> json) =>
    BusStopEntity(
      routeId: (json['routeId'] as num?)?.toInt(),
      nameZh: json['nameZh'] as String?,
      seqNo: (json['seqNo'] as num?)?.toInt(),
      pgp: json['pgp'] as String?,
      terminal: json['terminal'] as String?,
      districtId: json['districtId'] as String?,
      goBack: (json['goBack'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      extVoiceNo: json['extVoiceNo'] as String?,
      sid: (json['sid'] as num?)?.toInt(),
      ivrNo: (json['ivrNo'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BusStopEntityToJson(BusStopEntity instance) =>
    <String, dynamic>{
      'routeId': instance.routeId,
      'nameZh': instance.nameZh,
      'seqNo': instance.seqNo,
      'pgp': instance.pgp,
      'terminal': instance.terminal,
      'districtId': instance.districtId,
      'goBack': instance.goBack,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'extVoiceNo': instance.extVoiceNo,
      'sid': instance.sid,
      'ivrNo': instance.ivrNo,
      'id': instance.id,
      'totalCount': instance.totalCount,
    };
