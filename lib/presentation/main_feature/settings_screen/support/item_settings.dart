class ItemSetting{

  static const acSaleInfo = 1;
  static const acBusStop = 2;
  static const acOrderHistory = 3;
  static const acCheckMonthCardInfo = 4;
  static const acDarModeInfo = 5;

  final String title;
  String? value;
  bool? boolValue;
  int? actionCode;
  ItemSetting({required this.title, this.actionCode, this.value, this.boolValue});
}

enum TypeItemSettings{
  typeInfo, typeSupport
}