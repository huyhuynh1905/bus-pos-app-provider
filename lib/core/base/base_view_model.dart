import 'package:bus_pos_app/data/local/prefs_shared.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/shared/routers/navigation_services.dart';
import 'package:bus_pos_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';


class BaseViewModel extends ChangeNotifier {
  bool isInit = false;
  late BuildContext context;
  late Map<String, dynamic> arguments;
  late NavigationService navigationService;
  late Utils utilsCommon;
  final prefShared = getIt.get<PrefsShared>();

  void init(){

  }
}
