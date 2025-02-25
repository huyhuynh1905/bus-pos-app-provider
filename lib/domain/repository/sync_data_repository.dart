import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/domain/entity/account_info_entity.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/domain/entity/object_type_month_entity.dart';
import 'package:bus_pos_app/domain/entity/pos_para_entity.dart';
import 'package:bus_pos_app/domain/entity/route_info_entity.dart';
import 'package:bus_pos_app/domain/entity/shift_scheduler_entity.dart';
import 'package:bus_pos_app/domain/entity/ticket_response_entity.dart';

abstract class SyncDataRepository{
  Future<DataState<List<ShiftSchedulerEntity>>> getShiftScheduler(String? sellerIdCard, String? scheduleTime);
  Future<DataState<RouteInfoEntity>> getRouteInfo(int? routeId, String? node);
  Future<DataState<TicketResponseEntity>> getTicketProduct(int? routeId);
  Future<DataState<List<PosParaEntity>>> getPosPara();
  Future<DataState<List<ObjectTypeMonthEntity>>> getObjectTypeMonthCard();
  Future<DataState<String?>> getAllWhiteListMonthCard(int? routeId);
  Future<DataState<String?>> getAllBlackATM();
  Future<DataState<String?>> getTodayBlackATM();
}