import 'package:bus_pos_app/data/local/objectbox/bus_stop_objectbox.dart';
import 'package:bus_pos_app/data/local/objectbox/pos_para_objectbox.dart';
import 'package:bus_pos_app/data/local/objectbox/route_objectbox.dart';
import 'package:bus_pos_app/data/local/objectbox/shift_scheduler_objectbox.dart';
import 'package:bus_pos_app/data/local/objectbox/summary_scheduler_objectbox.dart';
import 'package:bus_pos_app/data/local/objectbox/ticket_product_objectbox.dart';
import 'package:bus_pos_app/di/locator.dart';

class ObjectBoxDB {
  //db
  final schedulerBox = getIt<ShiftSchedulerObjectbox>();
  final routeBox = getIt<RouteObjectbox>();
  final busStopBox = getIt<BusStopObjectbox>();
  final summarySchedulersBox = getIt<SummarySchedulerObjectbox>();
  final ticketProductBox = getIt<TicketProductObjectbox>();
  final posParaBox = getIt<PosParaObjectbox>();

  resetDataSync(){
    schedulerBox.clearAllData();
    routeBox.clearAllData();
    busStopBox.clearAllData();
    summarySchedulersBox.clearAllData();
    ticketProductBox.clearAllData();
    posParaBox.clearAllData();
  }

  resetDataRouteInfoForSync(){
    routeBox.clearAllData();
    busStopBox.clearAllData();
    summarySchedulersBox.clearAllData();
  }

  clearDataForLogOut(){
    schedulerBox.clearAllData();
    routeBox.clearAllData();
    busStopBox.clearAllData();
    summarySchedulersBox.clearAllData();
    ticketProductBox.clearAllData();
    posParaBox.clearAllData();
  }
}