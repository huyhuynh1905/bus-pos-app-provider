import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'ticket_product_entity.g.dart';

@JsonSerializable()
@Entity()
class TicketProductEntity {

  @JsonKey(includeFromJson: false, includeToJson: false)
  @Id()
  int? localId;

  String? name;
  String? code;
  int? amount;
  String? serialFormat;
  int? routeId;
  String? description;
  String? type;
  int? isActive;
  String? temThangType;
  String? objectType;
  bool? isMultiRoutes;

  @JsonKey(name: "id")
  int? id;
  int? totalCount;

  TicketProductEntity({
    this.localId,
    this.name,
    this.code,
    this.amount,
    this.serialFormat,
    this.routeId,
    this.description,
    this.type,
    this.isActive,
    this.temThangType,
    this.objectType,
    this.isMultiRoutes,
    this.id,
    this.totalCount,
  });

  factory TicketProductEntity.fromJson(Map<String, dynamic> json) => _$TicketProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TicketProductEntityToJson(this);
}
