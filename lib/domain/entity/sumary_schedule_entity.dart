import 'package:json_annotation/json_annotation.dart';

part 'sumary_schedule_entity.g.dart';

@JsonSerializable()
class SummaryScheduleEntity {

  int? ticketId;
  int? routeId;
  String? scheduleId;
  int? serialTo;
  int? totalAmount;
  int? totalQuantity;
  int? goBack;
  String? carId;
  String? driverLicense;
  DateTime? scheduleTime;
  String? node;
  String? sellerIdCard;
  int? isSync;
  DateTime? syncDate;
  int? shiftSchedulerId;
  int? id;
  int? totalCount;

  SummaryScheduleEntity({
     this.ticketId,
     this.routeId,
     this.scheduleId,
     this.serialTo,
     this.totalAmount,
     this.totalQuantity,
     this.goBack,
     this.carId,
     this.driverLicense,
     this.scheduleTime,
     this.node,
     this.sellerIdCard,
     this.isSync,
     this.syncDate,
     this.shiftSchedulerId,
     this.id,
     this.totalCount,
  });

  factory SummaryScheduleEntity.fromJson(Map<String, dynamic> json) => _$SummaryScheduleEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryScheduleEntityToJson(this);
}
