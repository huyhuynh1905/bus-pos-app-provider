import 'package:bus_pos_app/data/remote/app_dio_api.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:bus_pos_app/data/remote/api_sub_link.dart';

part 'api_authentication.g.dart';


@RestApi()
abstract class APIAuthentication {
  factory APIAuthentication(AppDio dio) = _APIAuthentication;

  @POST(ApiSubLink.pathLogin)
  Future<BaseResponseObj> authAccount(@Body() Map<String, dynamic> map);

  @GET(ApiSubLink.pathAccountInfo)
  Future<BaseResponseObj> getAccountInfo(@Header(Constants.fieldAuthorization) String accessToken);
}
