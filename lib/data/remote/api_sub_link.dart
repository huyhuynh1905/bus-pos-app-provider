class ApiSubLink {
  static const String pathLogin = "api/v1/authentication/authenticate";
  static const String pathAccountInfo = "pos/v1/account/get-account-info";

  //sync
  static const String pathShiftScheduler = "pos/v2/shiftscheduler/getbydate";
  static const String pathCheckShinhan = "/api/v2/setting/app";
  static const String pathRouteInfo = "/pos/v1/mroute/getbyid";
  static const String pathTicketProducts = "/pos/v1/ticketproduct/getbyrouteid";
  static const String pathPosPara = "/pos/v1/businesssetting/pos-para";
  static const String pathObjectTypeMonthCard = "/pos/v1/businesssetting/object-type";
  static const String pathAllWhiteMonthCard = "/pos/v1/monthcard/getwhitelist/{routeID}";
  static const String pathAllBlackATM = "/pos/v1/blacklistcard/getblacklistfile";
  static const String pathTodayBlackATM = "/pos/v1/blacklistcard/getblacklistfileadd";
}
