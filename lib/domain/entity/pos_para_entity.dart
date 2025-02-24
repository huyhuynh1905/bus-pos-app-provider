import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'pos_para_entity.g.dart';

@JsonSerializable()
@Entity()
class PosParaEntity {

  //const


  @JsonKey(includeFromJson: false, includeToJson: false)
  @Id()
  int? localId;

  String? settingType;
  String? settingKey;
  String? settingValue;
  String? description;
  int? companyId;
  int? id;
  int? totalCount;

  PosParaEntity({
    this.localId,
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
