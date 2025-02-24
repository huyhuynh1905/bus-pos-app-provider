import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/bus_stop_entity.dart';
import 'package:bus_pos_app/domain/entity/route_entity.dart';
import 'package:bus_pos_app/domain/entity/shift_scheduler_entity.dart';
import 'package:bus_pos_app/domain/entity/sumary_schedule_entity.dart';
import 'package:bus_pos_app/domain/entity/support_ui/item_sync_entity.dart';
import 'package:bus_pos_app/domain/entity/ticket_product_entity.dart';
import 'package:bus_pos_app/domain/usecase/sync_data_usecase.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/shared/utils/date_time_utils.dart';

class SyncDateViewModel extends BaseViewModel{

  bool isCanNext = true;

  final _syncUseCase = getIt<SyncDataUseCase>();



  List<ShiftSchedulerEntity> shifSchedulers = [];
  ShiftSchedulerEntity? currentScheduler;
  List<ShiftSchedulerEntity> uniqueShiftSchedulesForRoute = [];
  List<ShiftSchedulerEntity> uniqueShiftSchedulesForTicket = [];
  List<ShiftSchedulerEntity> uniqueShiftSchedulesForSummary = [];

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
    //xoá data trước
    db.resetDataSync();

    //
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
        _syncRouteInfo();
        break;
      case ItemSyncEntity.typeTicket:
        _syncTicketProduct();
        break;
      case ItemSyncEntity.typeLockAtm:
        break;
      case ItemSyncEntity.typeLockAllAtm:
        break;
      case ItemSyncEntity.typeObjMonth:
        break;
      case ItemSyncEntity.typeInfoPOS:
        _syncPosPara();
        break;
      case ItemSyncEntity.typeMonthCard:
        break;
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
        shifSchedulers = result.dataState??[];
        currentScheduler = shifSchedulers.firstOrNull;
        prefsScrypt.saveCurrentScheduler(utilsCommon.convertJsonMapToStr(currentScheduler?.toJson()));
        //insert db
        db.schedulerBox.insertShiftSchedulers(shifSchedulers);
        _convertList(shifSchedulers);
        //chạy list item chưa sync
        for(int i=1;i<listSync.length;i++){
          resyncItem(listSync[i].type, i);
        }

      } else {
        _updateStatusByType(ItemSyncEntity.typeScheduler, ItemSyncEntity.statusFailed);
      }
    } else {
      _updateStatusByType(ItemSyncEntity.typeScheduler, ItemSyncEntity.statusFailed);
    }
  }

  _syncRouteInfo() async {
    db.resetDataRouteInfoForSync();

    List<RouteEntity> routesList = [];
    List<BusStopEntity> busStopsList = [];
    List<SummaryScheduleEntity> summarysList = [];
    for (var e in uniqueShiftSchedulesForRoute.toList()) {
      final result = await _syncUseCase.getRouteInfo(e.routeId, e.node);
      if(result is DataSuccess && result.dataState!=null) {
        final route = result.dataState?.route;
        final busStops = result.dataState?.busStops;
        final summarySchedules = result.dataState?.summarySchedules;
        //add
        if(route!=null) routesList.add(route);
        busStopsList.addAll(busStops??[]);
        summarysList.addAll(summarySchedules??[]);

        uniqueShiftSchedulesForRoute.remove(e);
      } else {
        break;
      }
    }

    if(uniqueShiftSchedulesForRoute.isEmpty){
      //insert
      db.routeBox.insertRoutes(routesList);
      db.busStopBox.insertBusStops(busStopsList);
      db.summarySchedulersBox.insertSummarySchedules(summarysList);
      _updateStatusByType(ItemSyncEntity.typeRoute, ItemSyncEntity.statusDone);
    } else {
      _updateStatusByType(ItemSyncEntity.typeRoute, ItemSyncEntity.statusFailed);
    }
  }

  _syncTicketProduct() async {
    List<TicketProductEntity> ticketList = [];

    for (var e in uniqueShiftSchedulesForTicket.toList()) {
      final result = await _syncUseCase.getTicketProduct(e.routeId);
      if(result is DataSuccess && result.dataState!=null) {
        final tickets = result.dataState?.ticketProducts??[];
        for (var ticket in tickets) {
          ticket.routeId = e.routeId ?? 0;
          ticketList.add(ticket);
        }
        uniqueShiftSchedulesForTicket.remove(e);
      } else {
        break;
      }
    }
    if(uniqueShiftSchedulesForTicket.isEmpty){
      //insert
      db.ticketProductBox.insertTicketProducts(ticketList);
      _updateStatusByType(ItemSyncEntity.typeTicket, ItemSyncEntity.statusDone);
    } else {
      _updateStatusByType(ItemSyncEntity.typeTicket, ItemSyncEntity.statusFailed);
    }
  }

  _syncPosPara() async {
    final result = await _syncUseCase.getPosPara();
    if(result is DataSuccess){
      if(result.dataState?.isNotEmpty==true){
        final listPara = result.dataState??[];
        //insert
        db.posParaBox.insertPosParas(listPara);
      }
      _updateStatusByType(ItemSyncEntity.typeInfoPOS, ItemSyncEntity.statusDone);
    } else {
      _updateStatusByType(ItemSyncEntity.typeInfoPOS, ItemSyncEntity.statusFailed);
    }
  }

  _convertList(List<ShiftSchedulerEntity> list){
    uniqueShiftSchedulesForRoute.clear();
    uniqueShiftSchedulesForTicket.clear();
    uniqueShiftSchedulesForSummary.clear();
    if(list.isEmpty) return;
    uniqueShiftSchedulesForRoute.add(list[0]);
    uniqueShiftSchedulesForTicket.add(list[0]);
    uniqueShiftSchedulesForSummary.add(list[0]);

    List<String> listRouteNode = [];
    List<int> listRoute = [];

    listRouteNode.add("${list[0].routeId??0}${list[0].node??"0"}");
    listRoute.add(list[0].routeId??0);

    for (var e in list) {
      final newRouteNode = "${e.routeId??0}${e.node??"0"}";
      final newRoute = e.routeId??0;
      if(!listRouteNode.any((item)=>item==newRouteNode)){
        uniqueShiftSchedulesForRoute.add(e);
        uniqueShiftSchedulesForSummary.add(e);
        listRouteNode.add(newRouteNode);
      }
      if(!listRoute.any((item)=>item==newRoute)){
        uniqueShiftSchedulesForTicket.add(e);
        listRoute.add(newRoute);
      }
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