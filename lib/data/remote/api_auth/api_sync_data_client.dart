import 'package:bus_pos_app/data/remote/api_sub_link.dart';
import 'package:bus_pos_app/data/remote/app_dio_api.dart';
import 'package:bus_pos_app/domain/entity/base_response_list.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/domain/entity/base_response_primitive.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_sync_data_client.g.dart';


@RestApi()
abstract class APISyncDataClient {
  factory APISyncDataClient(AppDio dio) = _APISyncDataClient;

  @POST(ApiSubLink.pathShiftScheduler)
  Future<BaseResponseList> getShiftScheduler(
    @Header(Constants.fieldAuthorization) String accessToken,
    @Body() Map<String, dynamic> map
  );

  @POST(ApiSubLink.pathRouteInfo)
  Future<BaseResponseObj> getRouteInfo(
      @Header(Constants.fieldAuthorization) String accessToken,
      @Body() Map<String, dynamic> map
  );

  @POST(ApiSubLink.pathTicketProducts)
  Future<BaseResponseObj> getTicketProducts(
      @Header(Constants.fieldAuthorization) String accessToken,
      @Query(Constants.routeId) int? routeId
  );

  @GET(ApiSubLink.pathPosPara)
  Future<BaseResponseList> getPosPara(
      @Header(Constants.fieldAuthorization) String accessToken,
  );

  @GET(ApiSubLink.pathObjectTypeMonthCard)
  Future<BaseResponseList> getObjectTypeMonthCard(
      @Header(Constants.fieldAuthorization) String accessToken,
  );

  @GET(ApiSubLink.pathAllWhiteMonthCard)
  Future<BaseResponsePrimitive<String?>> downloadAllWhiteMonthCard(
    @Header(Constants.fieldAuthorization) String accessToken,
    @Path(Constants.routeIdPath) int? routeId
  );

  @GET(ApiSubLink.pathAllBlackATM)
  Future<String?> downloadAllBlackATM(
    @Header(Constants.fieldAuthorization) String accessToken,
  );

  @GET(ApiSubLink.pathTodayBlackATM)
  Future<String?> downloadTodayBlackATM(
    @Header(Constants.fieldAuthorization) String accessToken,
  );
}
