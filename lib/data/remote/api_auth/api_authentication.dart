import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:bus_pos_app/data/remote/api_sub_link.dart';

part 'api_authentication.g.dart';


@RestApi()
abstract class APIAuthentication {
  factory APIAuthentication(Dio dio) = _APIAuthentication;

  @POST(ApiSubLink.pathLogin)
  Future<BaseResponse> authAccount(@Body() Map<String, dynamic> map);
}
