import 'dart:async';

import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/shared/routers/navigation_services.dart';
import 'package:bus_pos_app/shared/routers/router_constant.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashViewModel extends BaseViewModel {

  PackageInfo? packageInfo;
  var isRequestDone = true;//false;
  var isCountDownDone = false;
  var isLoadingButton = false;

  Future<void> getPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> countDownToNext(BuildContext context) async {
    final dataAccount = await utilsCommon.getTokenAuthModel();
    if(dataAccount!=null){
      final expiredTimeStr = dataAccount.expired;
      //final exporedTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      Timer(const Duration(seconds: 2), () {
        isCountDownDone = true;
        if (isRequestDone) {
          moveToNext(context);
        }
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        isCountDownDone = true;
        if (isRequestDone) {
          moveToNext(context);
        }
      });
    }
  }

  changeLoading(){
    isLoadingButton = true;
    notifyListeners();
    Timer(const Duration(seconds: 5), () {
      isLoadingButton = false;
      notifyListeners();
    });
  }


  moveToNext(context){
    navigationService.navigateTo(RouteConstant.loginScreen,type: NavigationService.pushAndRemoveUntil);
  }
}
