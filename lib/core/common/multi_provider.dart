import 'package:provider/provider.dart';
import 'package:bus_pos_app/presentation/onboard_feature/splash_screen/splash_viewmodel.dart';

List<ChangeNotifierProvider> getAppProviders() {
  return [
    ChangeNotifierProvider<SplashViewModel>(
      create: (context) => SplashViewModel(),
    ),
  ];
}
