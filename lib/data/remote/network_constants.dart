import 'package:bus_pos_app/app_config.dart';
import 'package:bus_pos_app/shared/utils/common.dart';

class NetworkConstants {
  static const baseUrlDev = "https://api.checkinpro.vn/";
  static const baseUrlStaging = "https://api.checkinpro.vn/";
  static const baseUrlProd = "https://api.checkinpro.vn/";

  static Map<String, String> headers = {
    "Accept": "application/json; charset=utf-8",
    "Content-Type": "application/json; charset=utf-8",
  };

  static String get baseUrl {
    final environment = AppConfig.getEnvironment();
    customLog("$environment");
    switch (environment) {
      case Environment.dev:
        return baseUrlDev;
      case Environment.uat:
        return baseUrlStaging;
      case Environment.prod:
        return baseUrlProd;
      default:
        return baseUrlProd;
    }
  }
}
