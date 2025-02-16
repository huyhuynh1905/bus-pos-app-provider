import 'package:json_annotation/json_annotation.dart';

part 'company_info_entity.g.dart';

@JsonSerializable()
class CompanyInfoEntity {

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'systemCode')
  String? systemCode;

  @JsonKey(name: 'systemName')
  String? systemName;

  @JsonKey(name: 'logoFileName')
  String? logoFileName;

  @JsonKey(name: 'logoMiniRepoId')
  int? logoMiniRepoId;

  @JsonKey(name: 'website')
  String? website;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'companyUrl')
  String? companyUrl;

  @JsonKey(name: 'deputy')
  String? deputy;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;

  @JsonKey(name: 'taxCode')
  String? taxCode;

  @JsonKey(name: 'city')
  String? city;

  CompanyInfoEntity(
      this.name,
      this.address,
      this.description,
      this.systemCode,
      this.systemName,
      this.logoFileName,
      this.logoMiniRepoId,
      this.website,
      this.overview,
      this.companyUrl,
      this.deputy,
      this.email,
      this.phoneNumber,
      this.taxCode,
      this.city,
      );

  factory CompanyInfoEntity.fromJson(Map<String, dynamic> json) => _$CompanyInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoEntityToJson(this);
}
