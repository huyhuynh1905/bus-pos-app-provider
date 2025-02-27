// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankInfoEntity _$BankInfoEntityFromJson(Map<String, dynamic> json) =>
    BankInfoEntity(
      localId: (json['localId'] as num?)?.toInt(),
      code: json['code'] as String?,
      benId: json['ben_id'] as String?,
      bankBin: json['bank_bin'] as String?,
      shortName: json['short_name'] as String?,
    );

Map<String, dynamic> _$BankInfoEntityToJson(BankInfoEntity instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'code': instance.code,
      'ben_id': instance.benId,
      'bank_bin': instance.bankBin,
      'short_name': instance.shortName,
    };
