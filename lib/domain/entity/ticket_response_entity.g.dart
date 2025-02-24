// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketResponseEntity _$TicketResponseEntityFromJson(
        Map<String, dynamic> json) =>
    TicketResponseEntity(
      ticketProducts: (json['ticketProducts'] as List<dynamic>?)
          ?.map((e) => TicketProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketResponseEntityToJson(
        TicketResponseEntity instance) =>
    <String, dynamic>{
      'ticketProducts': instance.ticketProducts,
    };
