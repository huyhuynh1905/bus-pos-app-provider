
class Constants{
  static const ipadCode = "IPAD";
  static const androidCode = "ANDROID";
  static const iosCode = "IOS";

  //constant
  static const typePOS = "POS";

  //field:
  static const String fieldAuthorization = "Authorization";
  static const String fieldTOKEN = "TOKEN";
  static const String fieldBearer = "Bearer ";
  static const String fieldUsername = "username";
  static const String fieldPassword = "password";
  static const String fieldType = "type";
  static const String fieldSystemCode = "systemCode";
  static const String fieldFirebaseToken = "firebaseId";
  static const String fieldLanguage = "language";
  static const String fieldOS = "osMobile";
  static const String fieldAppVersion = "appVersion";
  static const String fieldDomain = "domain";
  static const String systemType = "SYSTEM_TYPE";
  static const String sellerIdCard = "sellerIdCard";
  static const String scheduleId = "scheduleId";
  static const String shiftSchedulerId = "shiftSchedulerId";
  static const String goBack = "goBack";
  static const String syncDate = "syncDate";
  static const String scheduleTime = "scheduleTime";
  static const String sessionToken = "sessionToken";
  static const String routeId = "routeId";
  static const String routeIdPath = "routeID";
  static const String note = "note";
}

class LocaleConstants {
  const LocaleConstants._();

  static const en = 'en';
  static const vi = 'vi';
  static const defaultLocale = 'vi';
}

class ApiAuthorization {
  // static String authorization =
  //     'Bearer ${APIManagerBackend().getAcceptToken()}';
}

class TypeSyncDataLog{
  static const startScheduler = "START_SCHEDULER"; //bắt đầu ca
  static const endScheduler = "END_SCHEDULER"; //kết ca
  static const endRoute = "END_ROUTE"; //kết lượt
}
