import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:bus_pos_app/data/remote/network_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PaymentDio with DioMixin implements Dio {
  PaymentDio([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: NetworkConstants.paymentUrl,
      headers: NetworkConstants.headers,
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );

    this.options = options;
    interceptors.add(CustomInterceptor(this));
    if (kDebugMode) {
      // Local Log
      interceptors.add(PrettyDioLogger(
        responseBody: true,
        requestBody: true,
      ));
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
