// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfoEntity _$AccountInfoEntityFromJson(Map<String, dynamic> json) =>
    AccountInfoEntity(
      json['userName'] as String?,
      json['fullName'] as String?,
      json['phone'] as String?,
      json['email'] as String?,
      json['avatar'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['jobTitle'] as String?,
      json['firstLogin'] as bool?,
      (json['id'] as num?)?.toInt(),
      (json['routeId'] as num?)?.toInt(),
      json['idCard'] as String?,
      json['companyInfo'] == null
          ? null
          : CompanyInfoEntity.fromJson(
              json['companyInfo'] as Map<String, dynamic>),
      (json['actived'] as num?)?.toInt(),
      (json['locked'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AccountInfoEntityToJson(AccountInfoEntity instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'email': instance.email,
      'avatar': instance.avatar,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'jobTitle': instance.jobTitle,
      'firstLogin': instance.firstLogin,
      'id': instance.id,
      'routeId': instance.routeId,
      'idCard': instance.idCard,
      'companyInfo': instance.companyInfo,
      'actived': instance.actived,
      'locked': instance.locked,
    };
