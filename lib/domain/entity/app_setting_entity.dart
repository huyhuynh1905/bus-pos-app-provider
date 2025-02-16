import 'dart:convert';

class AppSettingEntity {
  String headPhoneNumber;
  String urlNoticeOfProcessingOfPersionalData;
  String urlIshinhanTermsOfUse;
  String urlCreditCardTermsOfUse;
  String urlGuideCashCodeWithdrawal;

  AppSettingEntity({
    required this.headPhoneNumber,
    required this.urlNoticeOfProcessingOfPersionalData,
    required this.urlIshinhanTermsOfUse,
    required this.urlCreditCardTermsOfUse,
    required this.urlGuideCashCodeWithdrawal,
  });

  factory AppSettingEntity.fromRawJson(String str) => AppSettingEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppSettingEntity.fromJson(Map<String, dynamic> json) => AppSettingEntity(
        headPhoneNumber: json["headPhoneNumber"],
        urlNoticeOfProcessingOfPersionalData: json["urlNoticeOfProcessingOfPersionalData"],
        urlIshinhanTermsOfUse: json["urlIshinhanTermsOfUse"],
        urlCreditCardTermsOfUse: json["urlCreditCardTermsOfUse"],
        urlGuideCashCodeWithdrawal: json["urlGuideCashCodeWithdrawal"],
      );

  Map<String, dynamic> toJson() => {
        "headPhoneNumber": headPhoneNumber,
        "urlNoticeOfProcessingOfPersionalData": urlNoticeOfProcessingOfPersionalData,
        "urlIshinhanTermsOfUse": urlIshinhanTermsOfUse,
        "urlCreditCardTermsOfUse": urlCreditCardTermsOfUse,
        "urlGuideCashCodeWithdrawal": urlGuideCashCodeWithdrawal,
      };
}
