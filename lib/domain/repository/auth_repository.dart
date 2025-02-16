import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/domain/entity/account_info_entity.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';

abstract class AuthRepository{
  Future<DataState<BaseResponse>> loginAccount(String username, String password);
  Future<DataState<AccountInfoEntity>> getAccountInfo();
}