import 'dart:convert';

/*
 * Created by DinhTC on 26/01/2024.
 * Company UNIT
 * Code is not just a tool; it's the art of turning ideas into reality.
 */

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
