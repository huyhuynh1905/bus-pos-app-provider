import 'package:json_annotation/json_annotation.dart';

part 'pos_para_entity.g.dart';

@JsonSerializable()
class PosParaEntity {

  String? settingType;
  String? settingKey;
  String? settingValue;
  String? description;
  int? companyId;
  int? id;
  int? totalCount;

  PosParaEntity({
    this.settingType,
    this.settingKey,
    this.settingValue,
    this.description,
    this.companyId,
    this.id,
    this.totalCount,
  });

  factory PosParaEntity.fromJson(Map<String, dynamic> json) => _$PosParaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PosParaEntityToJson(this);
}
