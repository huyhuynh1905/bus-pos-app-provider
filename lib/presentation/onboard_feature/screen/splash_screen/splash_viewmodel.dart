import 'dart:async';

import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/shared/routers/navigation_services.dart';
import 'package:bus_pos_app/shared/routers/router_constant.dart';
import 'package:bus_pos_app/shared/utils/date_time_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashViewModel extends BaseViewModel {

  PackageInfo? packageInfo;
  var isRequestDone = true;//false;
  var isCountDownDone = false;

  Future<void> getPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  ///Kiểm tra điều kiện để check next screen
  Future<void> countDownToNext() async {
    final dataAccount = await utilsCommon.getTokenAuthModel();
    if(dataAccount!=null){
      final expiredTimeStr = dataAccount.expired;
      if(DateTimeUtils.isAfterNow(expiredTimeStr??"")){
        //token còn hạn
        _timerNextScreen((){
          moveToSyncDateScreen();
        });
      } else {
        _timerNextScreen((){
          moveToLoginScreen(context);
        });
      }

    } else {
      _timerNextScreen((){
        moveToLoginScreen(context);
      });
    }
  }

  _timerNextScreen(Function nextScreenFunction){
    Timer(const Duration(seconds: 2), () {
      isCountDownDone = true;
      if (isRequestDone) {
        nextScreenFunction();
      }
    });
  }


  ///Đi đến màn hình login
  moveToLoginScreen(context){
    navigationService.navigateTo(RouteConstant.loginScreen,type: NavigationService.pushAndRemoveUntil);
  }

  ///Đi đến màn hình đồng bộ đầu ngày
  moveToSyncDateScreen(){
    navigationService.navigateTo(RouteConstant.syncDateScreen,type: NavigationService.pushAndRemoveUntil);
  }


}
