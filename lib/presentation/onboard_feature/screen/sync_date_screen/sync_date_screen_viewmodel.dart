import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/support_ui/item_sync_entity.dart';
import 'package:bus_pos_app/domain/usecase/sync_data_usecase.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/shared/utils/date_time_utils.dart';

class SyncDateViewModel extends BaseViewModel{

  bool isCanNext = true;

  final _syncUseCase = getIt<SyncDataUseCase>();
  
  List<ItemSyncEntity> listSync = [
    ItemSyncEntity(S.current.sync_schedule, ItemSyncEntity.typeScheduler, ItemSyncEntity.statusLoading),
    ItemSyncEntity(S.current.sync_route, ItemSyncEntity.typeRoute, ItemSyncEntity.statusLoading),
    ItemSyncEntity(S.current.sync_tickets, ItemSyncEntity.typeTicket, ItemSyncEntity.statusLoading),
    ItemSyncEntity(S.current.sync_lock_atm, ItemSyncEntity.typeLockAtm, ItemSyncEntity.statusLoading),
    ItemSyncEntity(S.current.sync_all_lock_atm, ItemSyncEntity.typeLockAllAtm, ItemSyncEntity.statusLoading),
    ItemSyncEntity(S.current.sync_object_month, ItemSyncEntity.typeObjMonth, ItemSyncEntity.statusLoading),
    ItemSyncEntity(S.current.sync_pos_info, ItemSyncEntity.typeInfoPOS, ItemSyncEntity.statusLoading),
    ItemSyncEntity(S.current.sync_month_card_route, ItemSyncEntity.typeMonthCard, ItemSyncEntity.statusLoading),
  ];
  
  @override
  init() async {
    _startSyncData();
  }

  _startSyncData(){
    syncShiftScheduler();
  }

  resyncItem(String type, int index) async {
    listSync[index].status = ItemSyncEntity.statusLoading;
    notifyListeners();
    switch(type){
      case ItemSyncEntity.typeScheduler:
        await syncShiftScheduler();
        break;
      case ItemSyncEntity.typeRoute:
      case ItemSyncEntity.typeTicket:
      case ItemSyncEntity.typeLockAtm:
      case ItemSyncEntity.typeLockAllAtm:
      case ItemSyncEntity.typeObjMonth:
      case ItemSyncEntity.typeInfoPOS:
      case ItemSyncEntity.typeMonthCard:
    }
  }

  syncShiftScheduler() async {
    final accountInfo = await prefsScrypt.getAccount();
    final result = await _syncUseCase.getShiftScheduler(
        accountInfo?.idCard,
        DateTimeUtils.formatDate(DateTime.now(),outputFm: DateTimeUtils.databaseFm)
    );
    if(result is DataSuccess){
      if(result.dataState?.isNotEmpty==true){
        _updateStatusByType(ItemSyncEntity.typeScheduler, ItemSyncEntity.statusDone);
        final listData = result.dataState;

        //chạy list item chưa sync

      } else {
        _updateStatusByType(ItemSyncEntity.typeScheduler, ItemSyncEntity.statusFailed);
      }
    } else {
      _updateStatusByType(ItemSyncEntity.typeScheduler, ItemSyncEntity.statusFailed);
    }
  }

  _updateStatusByType(String type, int status){
    for (var e in listSync) {
      if(e.type==type){
        e.status = status;
        if(status==ItemSyncEntity.statusDone){
          _checkAllDone();
        } else {
          notifyListeners();
        }
        break;
      }
    }
  }

  _checkAllDone(){
    isCanNext = !(listSync.any((e)=>e.status!=ItemSyncEntity.statusDone));
    notifyListeners();
  }
  
  
  
}