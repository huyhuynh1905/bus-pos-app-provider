import 'package:bus_pos_app/core/base_handler/base_data_state.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/base_response_object.dart';
import 'package:bus_pos_app/domain/repository/auth_repository.dart';

class AuthUseCase {
  final _authRepo = getIt.get<AuthRepository>();
  Future<DataState<BaseResponse>> loginAccount(String email, String password) => _authRepo.loginAccount(email, password);
}