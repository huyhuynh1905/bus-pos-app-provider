import 'package:json_annotation/json_annotation.dart';

part 'object_type_entity.g.dart';

@JsonSerializable()
class ObjectTypeEntity {

  String? settingType;
  String? settingKey;
  String? settingValue;
  String? description;
  int? companyId;
  int? id;
  int? totalCount;

  ObjectTypeEntity({
    this.settingType,
    this.settingKey,
    this.settingValue,
    this.description,
    this.companyId,
    this.id,
    this.totalCount,
  });

  factory ObjectTypeEntity.fromJson(Map<String, dynamic> json) => _$ObjectTypeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectTypeEntityToJson(this);
}
