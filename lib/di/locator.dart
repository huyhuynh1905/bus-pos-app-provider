import 'package:bus_pos_app/data/local/prefs_crypt.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_feature_client.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_sync_data_client.dart';
import 'package:bus_pos_app/data/remote/payment_dio_api.dart';
import 'package:bus_pos_app/data/repo_impl/auth_repository_impl.dart';
import 'package:bus_pos_app/data/repo_impl/sync_data_repository_impl.dart';
import 'package:bus_pos_app/domain/repository/auth_repository.dart';
import 'package:bus_pos_app/domain/repository/sync_data_repository.dart';
import 'package:bus_pos_app/domain/usecase/auth_usecase.dart';
import 'package:bus_pos_app/domain/usecase/sync_data_usecase.dart';
import 'package:bus_pos_app/presentation/guidle_feature/sample_component_viewmodel.dart';
import 'package:bus_pos_app/presentation/main_feature/settings_screen/settings_screen_viewmodel.dart';
import 'package:bus_pos_app/presentation/onboard_feature/login_screen/login_viewmodel.dart';
import 'package:bus_pos_app/presentation/sync_feature/sync_date_screen/sync_date_screen_viewmodel.dart';
import 'package:bus_pos_app/shared/routers/navigation_services.dart';
import 'package:bus_pos_app/shared/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bus_pos_app/core/common/app_provider.dart';
import 'package:bus_pos_app/data/local/prefs_shared.dart';
import 'package:bus_pos_app/data/remote/api_auth/api_authentication.dart';
import 'package:bus_pos_app/data/remote/app_dio_api.dart';
import 'package:bus_pos_app/presentation/onboard_feature/splash_screen/splash_viewmodel.dart';


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
  getIt.registerLazySingleton<AppDio>(() => AppDio());
  getIt.registerLazySingleton<PaymentDio>(() => PaymentDio());
  getIt.registerLazySingleton<APIAuthentication>(() => APIAuthentication(getIt()));
  getIt.registerLazySingleton<APISyncDataClient>(() => APISyncDataClient(getIt()));
  getIt.registerLazySingleton<APIPaymentClient>(() => APIPaymentClient(getIt()));

  //reposiotry
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  getIt.registerLazySingleton<SyncDataRepository>(() => SyncDataRepositoryImpl());

  //usecase
  getIt.registerLazySingleton(() => AuthUseCase());
  getIt.registerLazySingleton(() => SyncDataUseCase());

  //viewmodel
  getIt.registerLazySingleton<AppProvider>(() => AppProvider());
  getIt.registerLazySingleton<SampleComponentViewModel>(() => SampleComponentViewModel());
  getIt.registerFactory(() => SplashViewModel());
  getIt.registerFactory(() => LoginViewModel());
  getIt.registerFactory(() => SyncDateViewModel());
  getIt.registerFactory(() => SettingsScreenViewModel());
}
