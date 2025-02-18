import 'package:bus_pos_app/core/base_handler/api_handler.dart';
import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_feature_client.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_sync_data_client.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/pos_para_entity.dart';
import 'package:bus_pos_app/domain/entity/route_info_entity.dart';
import 'package:bus_pos_app/domain/entity/shift_scheduler_entity.dart';
import 'package:bus_pos_app/domain/entity/ticket_response_entity.dart';
import 'package:bus_pos_app/domain/repository/sync_data_repository.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:bus_pos_app/shared/utils/utils.dart';

class SyncDataRepositoryImpl extends SyncDataRepository{
  final posApi = getIt<APISyncDataClient>();
  final paymentApi = getIt<APIPaymentClient>();
  final utils = getIt<Utils>();


  @override
  Future<DataState<List<ShiftSchedulerEntity>>> getShiftScheduler(String? sellerIdCard, String? scheduleTime) async {
    final accessToken = await utils.getToken();
    final sessionToken = await utils.getSessionToken();
    final body = {
      Constants.sellerIdCard: sellerIdCard,
      Constants.scheduleTime: scheduleTime,
      Constants.sessionToken: sessionToken,
    };
    var dataResponse = await posApi.getShiftScheduler(accessToken, body);
    return ApiHandler.handleResponseList<ShiftSchedulerEntity>(
      named: "getShiftScheduler",
      dataResponse: dataResponse,
      fromJson: ShiftSchedulerEntity.fromJson
    );
  }

  @override
  Future<DataState<List<PosParaEntity>>> getPosPara() async {
    final accessToken = await utils.getToken();
    var dataResponse = await posApi.getPosPara(accessToken);
    return ApiHandler.handleResponseList<PosParaEntity>(
        named: "getPosPara",
        dataResponse: dataResponse,
        fromJson: PosParaEntity.fromJson
    );
  }

  @override
  Future<DataState<RouteInfoEntity>> getRouteInfo(int? routeId, String? node) async {
    final accessToken = await utils.getToken();
    final body = {
      Constants.routeId: routeId,
      Constants.note: node,
    };
    var dataResponse = await posApi.getRouteInfo(accessToken, body);
    return ApiHandler.handleResponseObj<RouteInfoEntity>(
        named: "getRouteInfo",
        dataResponse: dataResponse,
        fromJson: RouteInfoEntity.fromJson
    );
  }

  @override
  Future<DataState<TicketResponseEntity>> getTicketProduct(int? routeId) async {
    final accessToken = await utils.getToken();
    var dataResponse = await posApi.getTicketProducts(accessToken, routeId);
    return ApiHandler.handleResponseObj<TicketResponseEntity>(
        named: "getTicketProduct",
        dataResponse: dataResponse,
        fromJson: TicketResponseEntity.fromJson
    );
  }

}