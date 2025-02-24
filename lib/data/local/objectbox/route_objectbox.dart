import 'package:bus_pos_app/domain/entity/route_entity.dart';
import 'package:objectbox/objectbox.dart';

class RouteObjectbox {
  late Box<RouteEntity> _box;

  RouteObjectbox(Store store){
    _box = store.box<RouteEntity>();
  }

  insertRoute(RouteEntity? route){
    if(route==null) return;
    _box.put(route);
  }

  insertRoutes(List<RouteEntity> routes){
    _box.putMany(routes);
  }

  clearAllData(){
    _box.removeAll();
  }

}