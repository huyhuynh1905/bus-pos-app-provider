import 'package:bus_pos_app/data/local/objectbox/gen/objectbox.g.dart';
import 'package:bus_pos_app/domain/entity/bus_stop_entity.dart';
import 'package:objectbox/objectbox.dart';

class BusStopObjectbox {
  late Box<BusStopEntity> _box;

  BusStopObjectbox(Store store){
    _box = store.box<BusStopEntity>();
  }

  insertBusStops(List<BusStopEntity> busStops){
    _box.putMany(busStops, mode: PutMode.put);
  }

  List<BusStopEntity> getAllListBusStop(){
    final list = _box.getAll();
    return list;
  }

  List<BusStopEntity> getAllListBusStopByGoBack(int goBack){
    final list = _box.query(BusStopEntity_.goBack.equals(goBack)).build().find();
    return list;
  }

  clearAllData(){
    _box.removeAll();
  }

}