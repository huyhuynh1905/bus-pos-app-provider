import 'package:flutter/material.dart';

enum Environment { dev, prod, uat }

class AppConfig extends InheritedWidget {
  final Environment environment;

  const AppConfig({
    super.key,
    required super.child,
    required this.environment,
  });

  static AppConfig? _instance;

  static Future<void> setup(Environment environment, Widget child) async {
    _instance = AppConfig(environment: environment, child: child);
  }

  static Environment getEnvironment() {
    return _instance?.environment ?? Environment.prod;
  }

  static AppConfig? getInstance() {
    return _instance;
  }

  static AppConfig of(BuildContext context) {
    final appConfig = context.dependOnInheritedWidgetOfExactType<AppConfig>();
    return appConfig ?? getInstance()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
