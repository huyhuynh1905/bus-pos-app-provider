import 'package:bus_pos_app/core/base_handler/api_handler.dart';
import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_feature_client.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_sync_data_client.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/object_type_month_entity.dart';
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
    return await ApiHandler.handleResponseList<ShiftSchedulerEntity>(
      named: "getShiftScheduler",
      callApi: posApi.getShiftScheduler(accessToken, body),
      fromJson: ShiftSchedulerEntity.fromJson
    );
  }

  @override
  Future<DataState<List<PosParaEntity>>> getPosPara() async {
    final accessToken = await utils.getToken();
    return await ApiHandler.handleResponseList<PosParaEntity>(
        named: "getPosPara",
        callApi: posApi.getPosPara(accessToken),
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
    return await ApiHandler.handleResponseObj<RouteInfoEntity>(
        named: "getRouteInfo",
        callApi: posApi.getRouteInfo(accessToken, body),
        fromJson: RouteInfoEntity.fromJson
    );
  }

  @override
  Future<DataState<TicketResponseEntity>> getTicketProduct(int? routeId) async {
    final accessToken = await utils.getToken();
    return await ApiHandler.handleResponseObj<TicketResponseEntity>(
        named: "getTicketProduct",
        callApi: posApi.getTicketProducts(accessToken, routeId),
        fromJson: TicketResponseEntity.fromJson
    );
  }

  @override
  Future<DataState<List<ObjectTypeMonthEntity>>> getObjectTypeMonthCard() async {
    final accessToken = await utils.getToken();
    return await ApiHandler.handleResponseList<ObjectTypeMonthEntity>(
      named: "getObjectTypeMonthCard",
      callApi: posApi.getPosPara(accessToken),
      fromJson: ObjectTypeMonthEntity.fromJson
    );
  }

  @override
  Future<DataState<String?>> getAllWhiteListMonthCard(int? routeId) async {
    final accessToken = await utils.getToken();
    return await ApiHandler.handleResponsePrimitive<String?>(
        named: "getAllWhiteListMonthCard",
        callApi: posApi.downloadAllWhiteMonthCard(accessToken, routeId),
    );
  }

  @override
  Future<DataState<String?>> getAllBlackATM() async {
    final accessToken = await utils.getToken();
    return await ApiHandler.handleResponseBody<String?>(
      named: "getAllBlackATM",
      callApi: posApi.downloadAllBlackATM(accessToken),
    );
  }

  @override
  Future<DataState<String?>> getTodayBlackATM() async {
    final accessToken = await utils.getToken();
    return await ApiHandler.handleResponseBody<String?>(
      named: "getTodayBlackATM",
      callApi: posApi.downloadTodayBlackATM(accessToken),
    );
  }

}