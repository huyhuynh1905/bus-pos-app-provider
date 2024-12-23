import 'package:bus_pos_app/presentation/guidle_feature/sample_component_screen.dart';
import 'package:bus_pos_app/presentation/onboard_feature/screen/login_screen/login_screen.dart';
import 'package:bus_pos_app/presentation/onboard_feature/screen/splash_screen/splash_screen.dart';
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
