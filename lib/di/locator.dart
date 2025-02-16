import 'package:bus_pos_app/data/local/prefs_crypt.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_feature_client.dart';
import 'package:bus_pos_app/data/repo_impl/auth_repository_impl.dart';
import 'package:bus_pos_app/domain/repository/auth_repository.dart';
import 'package:bus_pos_app/domain/usecase/auth_usecase.dart';
import 'package:bus_pos_app/presentation/guidle_feature/sample_component_viewmodel.dart';
import 'package:bus_pos_app/presentation/onboard_feature/screen/login_screen/login_viewmodel.dart';
import 'package:bus_pos_app/presentation/onboard_feature/screen/sync_date_screen/sync_date_screen_viewmodel.dart';
import 'package:bus_pos_app/shared/routers/navigation_services.dart';
import 'package:bus_pos_app/shared/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bus_pos_app/core/common/app_provider.dart';
import 'package:bus_pos_app/data/local/prefs_shared.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_authentication.dart';
import 'package:bus_pos_app/data/remote/dio_api.dart';
import 'package:bus_pos_app/presentation/onboard_feature/screen/splash_screen/splash_viewmodel.dart';


final getIt = GetIt.instance;

setupLocator() async {

  //
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => Utils());

  //shared prefs
  final sharedPref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPref);
  getIt.registerLazySingleton(() => PrefsShared(getIt()));

  //secure storage
  AndroidOptions getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  final sectureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
  getIt.registerLazySingleton(() => sectureStorage);
  getIt.registerLazySingleton(() => PrefsCrypt(getIt()));

  //api
  getIt.registerLazySingleton<Dio>(() => AppDio());
  getIt.registerLazySingleton<APIAuthentication>(() => APIAuthentication(getIt()));
  getIt.registerLazySingleton<APIFeatureClient>(() => APIFeatureClient(getIt()));

  //reposiotry
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  //usecase
  getIt.registerLazySingleton(() => AuthUseCase());

  //viewmodel
  getIt.registerLazySingleton<AppProvider>(() => AppProvider());
  getIt.registerLazySingleton<SampleComponentViewModel>(() => SampleComponentViewModel());
  getIt.registerFactory(() => SplashViewModel());
  getIt.registerFactory(() => LoginViewModel());
  getIt.registerFactory(() => SyncDateViewModel());
}
