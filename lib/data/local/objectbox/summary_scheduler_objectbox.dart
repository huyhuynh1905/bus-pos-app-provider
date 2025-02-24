import 'package:bus_pos_app/domain/entity/route_entity.dart';
import 'package:bus_pos_app/domain/entity/shift_scheduler_entity.dart';
import 'package:bus_pos_app/domain/entity/sumary_schedule_entity.dart';
import 'package:objectbox/objectbox.dart';

class SummarySchedulerObjectbox {
  late Box<SummaryScheduleEntity> _box;

  SummarySchedulerObjectbox(Store store){
    _box = store.box<SummaryScheduleEntity>();
  }

  insertSummarySchedules(List<SummaryScheduleEntity> summarys){
    _box.putMany(summarys);
  }

  clearAllData(){
    _box.removeAll();
  }


}