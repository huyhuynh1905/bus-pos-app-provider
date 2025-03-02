import 'package:bus_pos_app/data/local/objectbox/objectbox_db.dart';
import 'package:bus_pos_app/data/local/storage_shared/prefs_crypt.dart';
import 'package:bus_pos_app/data/local/storage_shared/prefs_shared.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/shared/routers/navigation_services.dart';
import 'package:bus_pos_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class BaseViewModel extends ChangeNotifier {
  bool isInit = false;
  late BuildContext context;
  late Map<String, dynamic> arguments;
  late NavigationService navigationService;
  late Utils utilsCommon;
  final prefShared = getIt.get<PrefsShared>();
  final prefsScrypt = getIt.get<PrefsCrypt>();
  final db = getIt.get<ObjectBoxDB>();

  init(){

  }

  changeLoadingScreen(bool value){
    if(value){
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
    }
  }
}
