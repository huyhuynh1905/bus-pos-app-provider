import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'object_type_month_entity.g.dart';

@JsonSerializable()
@Entity()
class ObjectTypeMonthEntity {

  @JsonKey(includeFromJson: false, includeToJson: false)
  @Id()
  int? localId;

  String? settingType;
  String? settingKey;
  String? settingValue;
  String? description;
  int? companyId;
  int? id;

  ObjectTypeMonthEntity({
    this.localId,
    this.settingType,
    this.settingKey,
    this.settingValue,
    this.description,
    this.companyId,
    this.id,
  });

  factory ObjectTypeMonthEntity.fromJson(Map<String, dynamic> json) => _$ObjectTypeMonthEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectTypeMonthEntityToJson(this);
}
