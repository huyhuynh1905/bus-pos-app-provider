import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/core/base_handler/base_error.dart';
import 'package:bus_pos_app/domain/entity/base_response_list.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/domain/entity/base_response_primitive.dart';
import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:dio/dio.dart';

class ApiHandler {
  static dynamic handleResponseList<T>({
    String? named,
    required Future<BaseResponseList> callApi,
    required T Function(Map<String, dynamic>) fromJson
  }) async  {
    try {
      final dataResponse = await callApi;
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

  static dynamic handleResponseObj<T>({
    String? named,
    required Future<BaseResponseObj> callApi,
    required T Function(Map<String, dynamic>) fromJson
  }) async {
    try {
      final dataResponse = await callApi;
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


  static dynamic handleResponsePrimitive<T>({
    String? named,
    required Future<BaseResponsePrimitive<T>> callApi,
  }) async  {
    try {
      final dataResponse = await callApi;
      if (dataResponse.success == true) {
        T data = dataResponse.data as T;
        return DataSuccess(data);
      } else {
        final dataError = BaseError(
          data: dataResponse.data,
          message: dataResponse.errors?[0]??"",
        );
        return DataError<T>(dataError);
      }
    } on DioException catch (e) {
      customLog("$named - handleResponseList DioException: $e");
      final dataError = BaseError(
        data: null,
        message: "DioException: $e",
      );
      return DataError<T>(dataError);
    } catch (e){
      customLog("$named - handleResponseList catch: $e");
      final dataError = BaseError(
        data: null,
        message: e.toString(),
      );
      return DataError<T>(dataError);
    }
  }


  static dynamic handleResponseBody<T>({
    String? named,
    required Future<T> callApi,
  }) async  {
    try {
      final dataResponse = await callApi;
      if (dataResponse!=null) {
        T data = dataResponse as T;
        return DataSuccess(data);
      } else {
        final dataError = BaseError(
          data: dataResponse,
          message: "handleResponseBody error: $named",
        );
        return DataError<T>(dataError);
      }
    } on DioException catch (e) {
      customLog("$named - handleResponseList DioException: $e");
      final dataError = BaseError(
        data: null,
        message: "DioException: $e",
      );
      return DataError<T>(dataError);
    } catch (e){
      customLog("$named - handleResponseList catch: $e");
      final dataError = BaseError(
        data: null,
        message: e.toString(),
      );
      return DataError<T>(dataError);
    }
  }

}