import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const int pushNormal = 1;
  static const int pushReplace = 2;
  static const int pushAndRemoveUntil = 3;


  Future<Object?>? navigateTo<T extends ChangeNotifier>(String routeName, {int type = pushNormal,Object? arguments}) {
    switch (type) {
      case pushNormal:
        {
          return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
        }
      case pushReplace:
        {
          return navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
        }
      case pushAndRemoveUntil:
        {
          return navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false, arguments: arguments);
        }
    }
    return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  void navigatePop(BuildContext context, {Object? arguments}) {
    return navigatorKey.currentState?.pop(arguments);
  }
}