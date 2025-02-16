import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/domain/entity/account_info_entity.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/domain/entity/shift_scheduler_entity.dart';

abstract class SyncDataRepository{
  Future<DataState<List<ShiftSchedulerEntity>>> getShiftScheduler(String? sellerIdCard, String? scheduleTime);
}