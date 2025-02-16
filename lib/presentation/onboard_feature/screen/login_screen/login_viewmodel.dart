// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/data/local/prefs_shared_key.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/usecase/auth_usecase.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/shared/components/dialog_and_popup/show_popup_service.dart';
import 'package:bus_pos_app/shared/routers/navigation_services.dart';
import 'package:bus_pos_app/shared/routers/router_constant.dart';
import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:bus_pos_app/shared/utils/error_code.dart';
import 'package:bus_pos_app/shared/utils/supports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginViewModel extends BaseViewModel{
  final authUseCase = getIt.get<AuthUseCase>();
  bool isShowClear = false;
  bool isSecurePass = true;
  List<String> errorText = [];


  void showClear(bool isShow) {
    isShowClear = isShow;
    notifyListeners();
  }

  Future<void> showPass() async {
    isSecurePass = !isSecurePass;
    notifyListeners();
  }


  Future doLogin(BuildContext context, String username, String password) async {
    customLog("Do login call");
    changeLoadingScreen(true);
    //
    var result = await authUseCase.loginAccount(username, password);
    changeLoadingScreen(false);
    if (result is DataSuccess) {
      final baseResponse = result.dataState;
      if(baseResponse?.data!=null) {
        var authenticationString = utilsCommon.convertJsonMapToStr(baseResponse?.data);
        await prefsScrypt.saveAuthenticateModel(authenticationString);
        //tiếp tục lấy account info
        await _getAccountInfo();
      } else {
        showErrorDialog(_getMessageLoginFail(S.current.account_not_valid));
      }
    } else {
      final baseError = result.error;
      customLog("doLogin baseError: ${baseError?.message}");
      showErrorDialog(_getMessageLoginFail(baseError?.message??""));
    }
  }

  _moveToNextScreen() {
    navigationService.navigateTo(RouteConstant.syncDateScreen,type: NavigationService.pushAndRemoveUntil);
  }

  String _getMessageLoginFail(String message){
    switch(message){
      case ErrorCode.wrongUsername:
        return S.current.acc_wrong;
      case ErrorCode.accAlreadyLogedIn:
        return S.current.acc_loged_in;
      default:
        return S.current.error_when_login(message);
    }
  }



  changeLoadingScreen(bool value){
    if(value){
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
    }
  }

  ///lấy thông tin tài khoản
  _getAccountInfo() async {
    changeLoadingScreen(true);
    var result = await authUseCase.getAccountInfo();
    changeLoadingScreen(false);
    if(result is DataSuccess){
      if(result.dataState!=null) {
        //có account info
        final account = result.dataState;

        //lấy company info ra lưu
        final companyInfo = account?.companyInfo;
        await prefsScrypt.saveCompanyInfo(utilsCommon.convertJsonMapToStr(companyInfo?.toJson()));

        //lấy account info ra lưu
        await prefsScrypt.saveAccountInfo(utilsCommon.convertJsonMapToStr(account?.toJson()));

        //next screen
        _moveToNextScreen();
      } else {
        //báo lỗi và đăng xuất
        showErrorDialog(S.current.accinfo_error, acction: (){
          //đăng xuất để cover token
          prefsScrypt.deleteAll();
        });
      }
    } else {
      final baseError = result.error;
      showErrorDialog(baseError?.message??"");
    }

  }


  showErrorDialog(String message,{Function? acction}){
    ShowDialogServices.showOneButtonDialog(
      context: context,
      title: S.current.notify,
      btnTitle: S.current.close,
      message: message,
      btnAction: acction
    );
  }
}