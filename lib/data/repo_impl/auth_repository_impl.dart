import 'dart:io';

import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/core/base_handler/base_error.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_authentication.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/domain/repository/auth_repository.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:bus_pos_app/shared/utils/utils.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl extends AuthRepository{
  final apiAuth = getIt<APIAuthentication>();

  @override
  Future<DataState<BaseResponse>> loginAccount(String email, String password) async {
    try {
      final deviceInfo = await Utils().getDeviceInfo();
      String version = await Utils().getVersion();
      String os = Constants.iosCode;
      if (Platform.isAndroid) {
        os = Constants.androidCode;
      } else if (Platform.isIOS) {
        os = Constants.iosCode;
      }
      final map = {
        Constants.fieldUsername:email,
        Constants.fieldPassword:password,
        Constants.fieldType: deviceInfo.model,
        Constants.fieldLanguage: LocaleConstants.vi,
        Constants.fieldOS: os,
        Constants.fieldAppVersion: version,
        Constants.fieldDomain: "unit",
      };
      var dataResponse = await apiAuth.authAccount(map);
      if (dataResponse.success == true) {
        return DataSuccess(dataResponse);
      } else {
        final dataError = BaseError(
          data: dataResponse.data,
          message: dataResponse.errors?[0]??"",
        );
        return DataError(dataError);
      }
    } on DioException catch (e) {
      customLog("DioException: $e");
      final dataError = BaseError(
        data: null,
        message: "DioException: $e",
      );
      return DataError(dataError);
    } catch (e){
      final dataError = BaseError(
        data: null,
        message: e.toString(),
      );
      return DataError(dataError);
    }
  }

}