// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfor _$UserInforFromJson(Map<String, dynamic> json) => UserInfor(
      json['accountId'] as int,
      json['userName'] as String,
      json['fullName'] as String,
      json['email'] as String,
      json['fingerprint'] as String,
      json['phoneNumber'] as String,
      json['pushNotification'] as String,
      json['pushEmail'] as String,
      json['firstLogin'] as bool,
      json['isBuilding'] as bool,
      json['isEventTicket'] as bool,
    );

Map<String, dynamic> _$UserInforToJson(UserInfor instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'email': instance.email,
      'fingerprint': instance.fingerprint,
      'phoneNumber': instance.phoneNumber,
      'pushNotification': instance.pushNotification,
      'pushEmail': instance.pushEmail,
      'firstLogin': instance.firstLogin,
      'isBuilding': instance.isBuilding,
      'isEventTicket': instance.isEventTicket,
    };
