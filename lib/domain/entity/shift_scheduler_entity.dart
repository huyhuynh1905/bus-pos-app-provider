import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'shift_scheduler_entity.g.dart';

@JsonSerializable()
@Entity()
class ShiftSchedulerEntity {

  @JsonKey(name: 'localId')
  @Id()
  int? localId;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'carId')
  String? carId;

  @JsonKey(name: 'driverLicense')
  String? driverLicense;

  @JsonKey(name: 'goBack')
  String? goBack;

  @JsonKey(name: 'routeId')
  int? routeId;

  @JsonKey(name: 'scheduleId')
  String? scheduleId;

  @JsonKey(name: 'routeCode')
  String? routeCode;

  @JsonKey(name: 'scheduleTime')
  String? scheduleTime;

  @JsonKey(name: 'sellerIdCard')
  String? sellerIdCard;

  @JsonKey(name: 'node')
  String? node;

  ShiftSchedulerEntity(
      this.localId,
      this.id,
      this.carId,
      this.driverLicense,
      this.goBack,
      this.routeId,
      this.scheduleId,
      this.routeCode,
      this.scheduleTime,
      this.sellerIdCard,
      this.node,
      );

  factory ShiftSchedulerEntity.fromJson(Map<String, dynamic> json) => _$ShiftSchedulerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftSchedulerEntityToJson(this);


}
