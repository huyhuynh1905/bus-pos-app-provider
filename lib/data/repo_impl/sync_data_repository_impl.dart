import 'dart:io';

import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/core/base_handler/base_error.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_authentication.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_feature_client.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_sync_data_client.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/account_info_entity.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/domain/entity/shift_scheduler_entity.dart';
import 'package:bus_pos_app/domain/repository/auth_repository.dart';
import 'package:bus_pos_app/domain/repository/sync_data_repository.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:bus_pos_app/shared/utils/utils.dart';
import 'package:dio/dio.dart';

class SyncDataRepositoryImpl extends SyncDataRepository{
  final posApi = getIt<APISyncDataClient>();
  final paymentApi = getIt<APIPaymentClient>();
  final utils = getIt<Utils>();


  @override
  Future<DataState<List<ShiftSchedulerEntity>>> getShiftScheduler(String? sellerIdCard, String? scheduleTime) async {
    try {
      final accessToken = await utils.getToken();
      final body = {
        Constants.sellerIdCard: sellerIdCard,
        Constants.scheduleTime: scheduleTime,
      };
      var dataResponse = await posApi.getShiftScheduler(accessToken, body);

      if (dataResponse.success == true && dataResponse.data!=null) {
        List<ShiftSchedulerEntity>? listData = dataResponse.data?.map((data) => ShiftSchedulerEntity.fromJson(data)).toList();
        return DataSuccess(listData??[]);
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