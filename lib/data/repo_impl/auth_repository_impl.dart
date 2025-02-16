import 'dart:io';

import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/core/base_handler/base_error.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_authentication.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/account_info_entity.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/domain/repository/auth_repository.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:bus_pos_app/shared/utils/utils.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl extends AuthRepository{
  final apiAuth = getIt<APIAuthentication>();
  final utils = getIt<Utils>();

  @override
  Future<DataState<BaseResponse>> loginAccount(String username, String password) async {
    try {
      final map = {
        Constants.fieldUsername:username,
        Constants.fieldPassword:password,
        Constants.fieldType: Constants.typePOS,
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

  @override
  Future<DataState<AccountInfoEntity>> getAccountInfo() async {
    try {
      final accessToken = await utils.getToken();
      var dataResponse = await apiAuth.getAccountInfo(accessToken);
      if (dataResponse.success == true && dataResponse.data!=null) {
        final data = AccountInfoEntity.fromJson(dataResponse.data??{});
        return DataSuccess(data);
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