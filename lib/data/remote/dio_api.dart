import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:bus_pos_app/data/remote/network_constants.dart';

class AppDio with DioMixin implements Dio {
  AppDio([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: NetworkConstants.baseUrl,
      headers: NetworkConstants.headers,
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );

    this.options = options;
    interceptors.add(CustomInterceptor(this));
    if (kDebugMode) {
      // Local Log
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = IOHttpClientAdapter();
  }
}

class CustomInterceptor extends Interceptor {
  final Dio _dio;

  CustomInterceptor(this._dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('CustomInterceptor onError ${err.response} = code: ${err.response?.statusCode}');
    return super.onError(err, handler);
  }
}

class StatusCode {
  static int successCode = 200;
}
