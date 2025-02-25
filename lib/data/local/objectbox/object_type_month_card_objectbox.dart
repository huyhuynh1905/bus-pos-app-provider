import 'package:bus_pos_app/data/local/objectbox/gen/objectbox.g.dart';
import 'package:bus_pos_app/domain/entity/object_type_month_entity.dart';
import 'package:bus_pos_app/domain/entity/pos_para_entity.dart';
import 'package:objectbox/objectbox.dart';

class ObjectTypeMonthCardObjectbox{
  late Box<ObjectTypeMonthEntity> _box;

  ObjectTypeMonthCardObjectbox(Store store){
    _box = store.box<ObjectTypeMonthEntity>();
  }

  insertObjectTypeMonth(List<ObjectTypeMonthEntity> types){
    _box.putMany(types);
  }

  List<ObjectTypeMonthEntity> getAll(){
    final list = _box.getAll();
    return list;
  }

  ObjectTypeMonthEntity? findBySettingKey(String settingKey){
    final value = _box.query(ObjectTypeMonthEntity_.settingKey.equals(settingKey, caseSensitive: false)).build().findFirst();
    return value;
  }

  clearAllData(){
    _box.removeAll();
  }

}