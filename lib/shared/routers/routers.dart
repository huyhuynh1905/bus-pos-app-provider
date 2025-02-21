import 'package:bus_pos_app/presentation/guidle_feature/sample_component_screen.dart';
import 'package:bus_pos_app/presentation/main_feature/settings_screen/settings_screen.dart';
import 'package:bus_pos_app/presentation/onboard_feature/login_screen/login_screen.dart';
import 'package:bus_pos_app/presentation/onboard_feature/splash_screen/splash_screen.dart';
import 'package:bus_pos_app/presentation/sync_feature/sync_date_screen/sync_date_screen.dart';
import 'package:bus_pos_app/shared/routers/router_constant.dart';
import 'package:flutter/material.dart';
import 'material_page_route_plus.dart';

///Nếu cần truyền và nhận argument thì truyền settings vào settings của MaterialPageRoutePlus
class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.splashScreen:
        return MaterialPageRoutePlus(builder: (_) => const SplashScreen());
      case RouteConstant.loginScreen:
        return MaterialPageRoutePlus(builder: (_) => const LoginScreen());
      case RouteConstant.sampleScreen:
        return MaterialPageRoutePlus(builder: (_) => const SampleComponentScreen());
      case RouteConstant.syncDateScreen:
        return MaterialPageRoutePlus(builder: (_) => const SyncDateScreen());
      case RouteConstant.settingsScreen:
        return MaterialPageRoutePlus(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoutePlus(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('${settings.name}'),
                  ),
                ));
    }
  }
}
