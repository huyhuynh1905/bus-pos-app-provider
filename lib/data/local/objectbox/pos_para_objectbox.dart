import 'package:bus_pos_app/data/local/objectbox/gen/objectbox.g.dart';
import 'package:bus_pos_app/domain/entity/pos_para_entity.dart';
import 'package:objectbox/objectbox.dart';

class PosParaObjectbox{
  late Box<PosParaEntity> _box;

  PosParaObjectbox(Store store){
    _box = store.box<PosParaEntity>();
  }

  insertPosParas(List<PosParaEntity> posParas){
    _box.putMany(posParas);
  }

  List<PosParaEntity> getAll(){
    final list = _box.getAll();
    return list;
  }

  PosParaEntity? findBySettingKey(String settingKey){
    final value = _box.query(PosParaEntity_.settingKey.equals(settingKey, caseSensitive: false)).build().findFirst();
    return value;
  }

  clearAllData(){
    _box.removeAll();
  }

}