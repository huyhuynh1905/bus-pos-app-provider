import 'package:bus_pos_app/domain/entity/ticket_product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_response_entity.g.dart';

@JsonSerializable()
class TicketResponseEntity {

  List<TicketProductEntity>? ticketProducts;

  TicketResponseEntity({
    this.ticketProducts,
  });

  factory TicketResponseEntity.fromJson(Map<String, dynamic> json) => _$TicketResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TicketResponseEntityToJson(this);
}
