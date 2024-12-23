import 'package:bus_pos_app/app_config.dart';
import 'package:bus_pos_app/shared/utils/custom_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'di/locator.dart';


class AppSetup {
  static run(AppConfig configuredApp) async {
    await _setup();
    await AppConfig.setup(configuredApp.environment, configuredApp.child);
    runApp(configuredApp);
    configLoading();
  }

  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false
      ..customAnimation = CustomAnimation();
  }

  static _setup() async {
    ///init change langue in method setLocation() of class LocaleProvider
    WidgetsFlutterBinding.ensureInitialized();

    ///status bar
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: SystemUiOverlayStyle.light.systemNavigationBarColor,
        statusBarColor: Colors.transparent,
      ),
    );

    ///getit
    await setupLocator();
  }
}
