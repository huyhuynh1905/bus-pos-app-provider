import 'package:bus_pos_app/domain/entity/company_info_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_info_entity.g.dart';

@JsonSerializable()
class AccountInfoEntity {

  @JsonKey(name: 'userName')
  String? userName;

  @JsonKey(name: 'fullName')
  String? fullName;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'avatar')
  String? avatar;

  @JsonKey(name: 'firstName')
  String? firstName;

  @JsonKey(name: 'lastName')
  String? lastName;

  @JsonKey(name: 'jobTitle')
  String? jobTitle;

  @JsonKey(name: 'firstLogin')
  bool? firstLogin;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'routeId')
  int? routeId;

  @JsonKey(name: 'idCard')
  String? idCard;

  @JsonKey(name: 'companyInfo')
  CompanyInfoEntity? companyInfo;

  @JsonKey(name: 'actived')
  int? actived;

  @JsonKey(name: 'locked')
  int? locked;

  AccountInfoEntity(
      this.userName,
      this.fullName,
      this.phone,
      this.email,
      this.avatar,
      this.firstName,
      this.lastName,
      this.jobTitle,
      this.firstLogin,
      this.id,
      this.routeId,
      this.idCard,
      this.companyInfo,
      this.actived,
      this.locked,
      );

  factory AccountInfoEntity.fromJson(Map<String, dynamic> json) => _$AccountInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AccountInfoEntityToJson(this);
}
