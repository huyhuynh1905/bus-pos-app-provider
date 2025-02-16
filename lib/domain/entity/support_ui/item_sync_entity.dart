class ItemSyncEntity{
  static const statusLoading = 1;
  static const statusDone = 2;
  static const statusFailed = 3;

  static const typeScheduler = "typeScheduler";
  static const typeRoute = "typeRoute";
  static const typeTicket = "typeTicket";
  static const typeLockAtm = "typeLockAtm";
  static const typeLockAllAtm = "typeLockAllAtm";
  static const typeObjMonth = "typeObjMonth";
  static const typeInfoPOS = "typeInfoPOS";
  static const typeMonthCard = "typeMonthCard";

  String title;
  String type;
  int status;

  ItemSyncEntity(this.title, this.type, this.status);
}