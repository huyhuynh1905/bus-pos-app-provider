import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/data/local/files/files_db.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/bus_stop_entity.dart';
import 'package:bus_pos_app/domain/entity/route_entity.dart';
import 'package:bus_pos_app/domain/entity/shift_scheduler_entity.dart';
import 'package:bus_pos_app/domain/entity/sumary_schedule_entity.dart';
import 'package:bus_pos_app/domain/entity/support_ui/item_sync_entity.dart';
import 'package:bus_pos_app/domain/entity/ticket_product_entity.dart';
import 'package:bus_pos_app/domain/usecase/sync_data_usecase.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/shared/components/dialog_and_popup/show_popup_service.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:bus_pos_app/shared/routers/navigation_services.dart';
import 'package:bus_pos_app/shared/routers/router_constant.dart';
import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:bus_pos_app/shared/utils/date_time_utils.dart';

class SyncDateViewModel extends BaseViewModel{

  bool isCanNext = true;

  final _syncUseCase = getIt<SyncDataUseCase>();
  final _fileDb = getIt<FilesDB>();

  //all done
  bool isDoneDataLog = false;
  bool isDoneBankInfo = false;
  bool isDonePublicKey = false;


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
        _syncTodayBlackATM();
        break;
      case ItemSyncEntity.typeLockAllAtm:
        _syncAllBlackATM();
        break;
      case ItemSyncEntity.typeObjMonth:
        _syncObjectTypeMonthCard();
        break;
      case ItemSyncEntity.typeInfoPOS:
        _syncPosPara();
        break;
      case ItemSyncEntity.typeMonthCard:
        _syncAllWhiteMonthCard();
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
    List<ShiftSchedulerEntity> forTicket = [];
    forTicket.addAll(uniqueShiftSchedulesForTicket);

    for (var e in forTicket.toList()) {
      final result = await _syncUseCase.getTicketProduct(e.routeId);
      if(result is DataSuccess && result.dataState!=null) {
        final tickets = result.dataState?.ticketProducts??[];
        for (var ticket in tickets) {
          ticket.routeId = e.routeId ?? 0;
          ticketList.add(ticket);
        }
        forTicket.remove(e);
      } else {
        break;
      }
    }
    if(forTicket.isEmpty){
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

  _syncObjectTypeMonthCard() async {
    final result = await _syncUseCase.getObjectTypeMonthCard();
    if(result is DataSuccess){
      if(result.dataState?.isNotEmpty==true){
        final objectTypeMonths = result.dataState??[];
        //insert
        db.objectTypeMonthBox.insertObjectTypeMonth(objectTypeMonths);
      }
      _updateStatusByType(ItemSyncEntity.typeObjMonth, ItemSyncEntity.statusDone);
    } else {
      _updateStatusByType(ItemSyncEntity.typeObjMonth, ItemSyncEntity.statusFailed);
    }
  }

  _syncAllWhiteMonthCard() async {
    List<ShiftSchedulerEntity> forMonthCard = [];
    forMonthCard.addAll(uniqueShiftSchedulesForTicket);
    String alldata = "";

    for (var e in forMonthCard.toList()) {
      final result = await _syncUseCase.getAllWhiteListMonthCard(e.routeId);
      if(result is DataSuccess) {
        final data = result.dataState??"";
        alldata+=",$data";
        forMonthCard.remove(e);
      } else {
        break;
      }
    }
    if(forMonthCard.isEmpty){
      //insert
      _fileDb.saveAllWhiteListMonthCard(alldata);

      _updateStatusByType(ItemSyncEntity.typeMonthCard, ItemSyncEntity.statusDone);
    } else {
      _updateStatusByType(ItemSyncEntity.typeMonthCard, ItemSyncEntity.statusFailed);
    }


  }

  _syncAllBlackATM() async {
    final result = await _syncUseCase.getAllBlackATM();
    if(result is DataSuccess){
      final data = result.dataState??"";
      _fileDb.saveAllBlackATM(data);
      _updateStatusByType(ItemSyncEntity.typeLockAllAtm, ItemSyncEntity.statusDone);
    } else {
      _updateStatusByType(ItemSyncEntity.typeLockAllAtm, ItemSyncEntity.statusFailed);
    }
  }

  _syncTodayBlackATM() async {
    final result = await _syncUseCase.getTodayBlackATM();
    if(result is DataSuccess){
      final data = result.dataState??"";
      _fileDb.saveTodayBlackATM(data);
      _updateStatusByType(ItemSyncEntity.typeLockAtm, ItemSyncEntity.statusDone);
    } else {
      _updateStatusByType(ItemSyncEntity.typeLockAtm, ItemSyncEntity.statusFailed);
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
    isCanNext = (listSync.any((e)=>e.status!=ItemSyncEntity.statusDone));
    notifyListeners();
  }

  nextAction() async {
    changeLoadingScreen(true);
    await _requestDataLog();
    await _requestPublicKey();
    await _requestBankBIN();

    //check done
    _checkRequestAllDone();
  }

  _requestDataLog() async {
    final todayStr = DateTimeUtils.formatDate(DateTime.now(),outputFm: DateTimeUtils.databaseFm);
    final result = await _syncUseCase.requestDataLog(currentScheduler, todayStr, TypeSyncDataLog.startScheduler);
    if(result is DataSuccess){
      isDoneDataLog = true;
    } else {
      isDoneDataLog = false;
    }
  }

  _requestPublicKey() async {
    final result = await _syncUseCase.requestPublicKey();
    if(result is DataSuccess){
      if(result.dataState?.isNotEmpty==true) {
        //lưu khoá
        prefsScrypt.savePublicKey(result.dataState??"");
        isDonePublicKey = true;
      } else {
        isDonePublicKey = false;
        showErrorDialog(S.current.publickey_error);
      }
    } else {
      isDonePublicKey = false;
      showErrorDialog(S.current.publickey_error);
    }
  }

  _requestBankBIN() async {
    db.bankInfoBox.clearAllData();
    final result = await _syncUseCase.getListBankInfos();
    if(result is DataSuccess){
      if(result.dataState?.isNotEmpty==true) {
        //lưu list
        db.bankInfoBox.insertBankInfos(result.dataState??[]);
      }
      isDoneBankInfo = true;
    } else {
      //bank_info_error
      showErrorDialog(S.current.bank_info_error);
      isDoneBankInfo = false;
    }
  }

  _checkRequestAllDone() {
    customLog("_checkRequestAllDone ==> $isDoneBankInfo && $isDoneDataLog && $isDonePublicKey");
    changeLoadingScreen(false);
    if(isDoneBankInfo && isDoneDataLog && isDonePublicKey){
      navigationService.navigateTo(RouteConstant.homeScreen,type: NavigationService.pushAndRemoveUntil);
    }
  }




  showErrorDialog(String message,{Function? acction}){
    ShowDialogServices.showOneButtonDialog(
      context: context,
      title: S.current.notify,
      btnTitle: S.current.close,
      message: message,
      btnAction: acction
    );
  }

}