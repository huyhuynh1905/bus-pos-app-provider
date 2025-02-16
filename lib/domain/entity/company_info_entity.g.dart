// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfoEntity _$CompanyInfoEntityFromJson(Map<String, dynamic> json) =>
    CompanyInfoEntity(
      json['name'] as String?,
      json['address'] as String?,
      json['description'] as String?,
      json['systemCode'] as String?,
      json['systemName'] as String?,
      json['logoFileName'] as String?,
      (json['logoMiniRepoId'] as num?)?.toInt(),
      json['website'] as String?,
      json['overview'] as String?,
      json['companyUrl'] as String?,
      json['deputy'] as String?,
      json['email'] as String?,
      json['phoneNumber'] as String?,
      json['taxCode'] as String?,
      json['city'] as String?,
    );

Map<String, dynamic> _$CompanyInfoEntityToJson(CompanyInfoEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'systemCode': instance.systemCode,
      'systemName': instance.systemName,
      'logoFileName': instance.logoFileName,
      'logoMiniRepoId': instance.logoMiniRepoId,
      'website': instance.website,
      'overview': instance.overview,
      'companyUrl': instance.companyUrl,
      'deputy': instance.deputy,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'taxCode': instance.taxCode,
      'city': instance.city,
    };
