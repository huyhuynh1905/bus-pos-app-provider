import 'package:bus_pos_app/data/remote/api_sub_link.dart';
import 'package:bus_pos_app/data/remote/app_dio_api.dart';
import 'package:bus_pos_app/domain/entity/base_response_list.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
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
}
