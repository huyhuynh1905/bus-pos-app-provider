import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/account_info_entity.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/domain/entity/shift_scheduler_entity.dart';
import 'package:bus_pos_app/domain/repository/auth_repository.dart';
import 'package:bus_pos_app/domain/repository/sync_data_repository.dart';

class SyncDataUseCase {
  final _syncRepo = getIt.get<SyncDataRepository>();
  Future<DataState<List<ShiftSchedulerEntity>>> getShiftScheduler(String? sellerIdCard, String? scheduleTime) => _syncRepo.getShiftScheduler(sellerIdCard, scheduleTime);
}