import 'package:bus_pos_app/domain/entity/ticket_product_entity.dart';
import 'package:objectbox/objectbox.dart';

class TicketProductObjectbox{
  late Box<TicketProductEntity> _box;

  TicketProductObjectbox(Store store){
    _box = store.box<TicketProductEntity>();
  }

  insertTicketProducts(List<TicketProductEntity> tickets){
    _box.putMany(tickets);
  }

  List<TicketProductEntity> getAll(){
    final list = _box.getAll();
    return list;
  }

  clearAllData(){
    _box.removeAll();
  }

}