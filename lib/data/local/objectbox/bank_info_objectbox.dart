import 'package:bus_pos_app/data/local/objectbox/gen/objectbox.g.dart';
import 'package:bus_pos_app/domain/entity/bank_info_entity.dart';
import 'package:bus_pos_app/domain/entity/bus_stop_entity.dart';
import 'package:objectbox/objectbox.dart';

class BankInfoObjectbox {
  late Box<BankInfoEntity> _box;

  BankInfoObjectbox(Store store){
    _box = store.box<BankInfoEntity>();
  }

  insertBankInfos(List<BankInfoEntity> bankInfos){
    _box.putMany(bankInfos, mode: PutMode.put);
  }

  List<BankInfoEntity> getAllBankInfos(){
    final list = _box.getAll();
    return list;
  }

  BankInfoEntity? getByBankBin(String bin){
    final data = _box.query(BankInfoEntity_.bankBin.equals(bin)).build().findFirst();
    return data;
  }

  clearAllData(){
    _box.removeAll();
  }

}