import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/core/base_handler/base_error.dart';
import 'package:bus_pos_app/domain/entity/base_response_list.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:dio/dio.dart';

class ApiHandler {
  static dynamic handleResponseList<T>({String? named, required BaseResponseList dataResponse, required T Function(Map<String, dynamic>) fromJson}) {
    try {
      if (dataResponse.success == true && dataResponse.data!=null) {
        List<T>? listData = dataResponse.data?.map((data) => fromJson(data)).toList();
        return DataSuccess(listData??[]);
      } else {
        final dataError = BaseError(
          data: dataResponse.data,
          message: dataResponse.errors?[0]??"",
        );
        return DataError<List<T>>(dataError);
      }
    } on DioException catch (e) {
      customLog("$named - handleResponseList DioException: $e");
      final dataError = BaseError(
        data: null,
        message: "DioException: $e",
      );
      return DataError<List<T>>(dataError);
    } catch (e){
      customLog("$named - handleResponseList catch: $e");
      final dataError = BaseError(
        data: null,
        message: e.toString(),
      );
      return DataError<List<T>>(dataError);
    }
  }

  static dynamic handleResponseObj<T>({String? named, required BaseResponse dataResponse, required T Function(Map<String, dynamic>) fromJson}) {
    try {
      if (dataResponse.success == true && dataResponse.data!=null) {
        T object = fromJson(dataResponse.data!);
        return DataSuccess(object);
      } else {
        final dataError = BaseError(
          data: dataResponse.data,
          message: dataResponse.errors?[0]??"",
        );
        return DataError<T>(dataError);
      }
    } on DioException catch (e) {
      customLog("$named - DioException: $e");
      final dataError = BaseError(
        data: null,
        message: "DioException: $e",
      );
      return DataError<T>(dataError);
    } catch (e){
      customLog("$named - catch: $e");
      final dataError = BaseError(
        data: null,
        message: e.toString(),
      );
      return DataError<T>(dataError);
    }
  }

}