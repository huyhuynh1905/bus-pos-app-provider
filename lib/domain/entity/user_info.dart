import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfor {
  @JsonKey(name: 'accountId')
  int accountId;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'fullName')
  String fullName;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'fingerprint')
  String fingerprint;

  @JsonKey(name: 'phoneNumber')
  String phoneNumber;

  @JsonKey(name: 'pushNotification')
  String pushNotification;

  @JsonKey(name: 'pushEmail')
  String pushEmail;

  @JsonKey(name: 'firstLogin')
  bool firstLogin;

  @JsonKey(name: 'isBuilding')
  bool isBuilding;

  @JsonKey(name: 'isEventTicket')
  bool isEventTicket;

  UserInfor(
      this.accountId,
      this.userName,
      this.fullName,
      this.email,
      this.fingerprint,
      this.phoneNumber,
      this.pushNotification,
      this.pushEmail,
      this.firstLogin,
      this.isBuilding,
      this.isEventTicket
  );

  factory UserInfor.fromJson(Map<String, dynamic> json) => _$UserInforFromJson(json);
}
