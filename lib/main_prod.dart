import 'package:bus_pos_app/app_config.dart';
import 'package:bus_pos_app/app_setup.dart';
import 'package:bus_pos_app/my_app.dart';

void main() {
  var configuredApp = const AppConfig(environment: Environment.prod, child: MyApp());
  AppSetup.run(configuredApp);
}
