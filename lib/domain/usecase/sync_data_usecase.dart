import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/bank_info_entity.dart';
import 'package:bus_pos_app/domain/entity/object_type_month_entity.dart';
import 'package:bus_pos_app/domain/entity/pos_para_entity.dart';
import 'package:bus_pos_app/domain/entity/route_info_entity.dart';
import 'package:bus_pos_app/domain/entity/shift_scheduler_entity.dart';
import 'package:bus_pos_app/domain/entity/ticket_response_entity.dart';
import 'package:bus_pos_app/domain/repository/sync_data_repository.dart';

class SyncDataUseCase {
  final _syncRepo = getIt.get<SyncDataRepository>();
  Future<DataState<List<ShiftSchedulerEntity>>> getShiftScheduler(String? sellerIdCard, String? scheduleTime) => _syncRepo.getShiftScheduler(sellerIdCard, scheduleTime);
  Future<DataState<RouteInfoEntity>> getRouteInfo(int? routeId, String? node) => _syncRepo.getRouteInfo(routeId, node);
  Future<DataState<TicketResponseEntity>> getTicketProduct(int? routeId) => _syncRepo.getTicketProduct(routeId);
  Future<DataState<List<PosParaEntity>>> getPosPara() => _syncRepo.getPosPara();
  Future<DataState<List<ObjectTypeMonthEntity>>> getObjectTypeMonthCard() => _syncRepo.getObjectTypeMonthCard();
  Future<DataState<String?>> getAllWhiteListMonthCard(int? routeId) => _syncRepo.getAllWhiteListMonthCard(routeId);
  Future<DataState<String?>> getAllBlackATM() => _syncRepo.getAllBlackATM();
  Future<DataState<String?>> getTodayBlackATM() => _syncRepo.getTodayBlackATM();
  Future<DataState<dynamic>> requestDataLog(ShiftSchedulerEntity? shiftScheduler, String syncDate, String typeSync) => _syncRepo.requestDataLog(shiftScheduler, syncDate, typeSync);
  Future<DataState<List<BankInfoEntity>>> getListBankInfos() => _syncRepo.getListBankInfos();
  Future<DataState<String?>> requestPublicKey() => _syncRepo.requestPublicKey();
}