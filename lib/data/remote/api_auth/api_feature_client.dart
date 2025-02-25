import 'package:bus_pos_app/data/remote/api_sub_link.dart';
import 'package:bus_pos_app/data/remote/payment_dio_api.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_feature_client.g.dart';

@RestApi()
abstract class APIPaymentClient {
  factory APIPaymentClient(PaymentDio dio) = _APIPaymentClient;

  @POST(ApiSubLink.pathCheckShinhan)
  Future<BaseResponseObj> checkFieldShinhan(@Header(Constants.fieldAuthorization) token, @Body() Map<String, dynamic> map);
}