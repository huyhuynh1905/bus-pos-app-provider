import 'package:bus_pos_app/domain/entity/route_entity.dart';
import 'package:bus_pos_app/domain/entity/shift_scheduler_entity.dart';
import 'package:objectbox/objectbox.dart';

class ShiftSchedulerObjectbox {
  late Box<ShiftSchedulerEntity> _box;

  ShiftSchedulerObjectbox(Store store){
    _box = store.box<ShiftSchedulerEntity>();
  }

  insertShiftSchedulers(List<ShiftSchedulerEntity> schedulers){
    _box.putMany(schedulers);
  }

  List<ShiftSchedulerEntity> getAll(){
    final list = _box.getAll();
    return list;
  }

  clearAllData(){
    _box.removeAll();
  }


}