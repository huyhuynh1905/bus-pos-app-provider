import 'package:bus_pos_app/data/remote/api_sub_link.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_feature_client.g.dart';

@RestApi()
abstract class APIFeatureClient {
  factory APIFeatureClient(Dio dio) = _APIFeatureClient;

  @POST(ApiSubLink.pathCheckShinhan)
  Future<BaseResponse> checkFieldShinhan(@Header(Constants.fieldAuthorization) token, @Body() Map<String, dynamic> map);
}