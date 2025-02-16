import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/domain/entity/support_ui/item_sync_entity.dart';
import 'package:bus_pos_app/generated/l10n.dart';

class SyncDateViewModel extends BaseViewModel{

  bool isCanNext = true;
  
  List<ItemSyncEntity> listSync = [
    ItemSyncEntity(S.current.sync_schedule, ItemSyncEntity.typeScheduler, ItemSyncEntity.statusLoading),
    ItemSyncEntity(S.current.sync_route, ItemSyncEntity.typeRoute, ItemSyncEntity.statusLoading),
    ItemSyncEntity(S.current.sync_tickets, ItemSyncEntity.typeTicket, ItemSyncEntity.statusDone),
    ItemSyncEntity(S.current.sync_lock_atm, ItemSyncEntity.typeLockAtm, ItemSyncEntity.statusDone),
    ItemSyncEntity(S.current.sync_all_lock_atm, ItemSyncEntity.typeLockAllAtm, ItemSyncEntity.statusLoading),
    ItemSyncEntity(S.current.sync_object_month, ItemSyncEntity.typeObjMonth, ItemSyncEntity.statusFailed),
    ItemSyncEntity(S.current.sync_pos_info, ItemSyncEntity.typeInfoPOS, ItemSyncEntity.statusFailed),
    ItemSyncEntity(S.current.sync_month_card_route, ItemSyncEntity.typeMonthCard, ItemSyncEntity.statusLoading),
  ];
  
  @override
  void init() {
    _startSyncData();
  }

  _startSyncData(){

  }

  resyncItem(String type, int index){
    listSync[index].status = ItemSyncEntity.statusLoading;
    notifyListeners();
  }
  
  
  
}