import 'package:bus_pos_app/shared/utils/utils.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/shared/routers/navigation_services.dart';
import 'package:bus_pos_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BaseViewModel extends ChangeNotifier {
  bool isInit = false;
  late BuildContext context;
  late Map<String, dynamic> arguments;
  late NavigationService navigationService;
  late Utils utilsCommon;
  SharedPreferences preferences = getIt.get<SharedPreferences>();
}
