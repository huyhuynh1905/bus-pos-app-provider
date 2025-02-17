import 'package:bus_pos_app/core/base_handler/api_handler.dart';
import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_feature_client.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_sync_data_client.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/shift_scheduler_entity.dart';
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

}