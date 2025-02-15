import 'package:bus_pos_app/core/common/app_provider.dart';
import 'package:bus_pos_app/core/common/multi_provider.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/app_themes.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:bus_pos_app/shared/routers/navigation_services.dart';
import 'package:bus_pos_app/shared/routers/router_constant.dart';
import 'package:bus_pos_app/shared/routers/routers.dart';
import 'package:bus_pos_app/shared/utils/custom_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'di/locator.dart';
import 'generated/l10n.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appNotifier = getIt<AppProvider>();

  @override
  void initState() {
    super.initState();
    AppThemesColors.of(context);
    _appNotifier.init();
    _initEasyLoading();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Dimens.current.init(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => _appNotifier),
          ...getAppProviders(),
        ],
        builder: (context, child) {
          return Consumer<AppProvider>(builder: (context, model, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              themeMode: model.isDarkThemes ? ThemeMode.dark : ThemeMode.light,
              darkTheme: AppThemes.darkTheme,
              initialRoute: RouteConstant.splashScreen,
              onGenerateRoute: Routers.generateRoute,
              navigatorKey: getIt<NavigationService>().navigatorKey,
              builder: EasyLoading.init(),
              localeResolutionCallback:
                  (Locale? locale, Iterable<Locale> supportedLocales) =>
                      supportedLocales.contains(locale)
                          ? locale
                          : const Locale(LocaleConstants.defaultLocale),
              locale: Locale(model.appLanguageCode),
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            );
          });
        });
  }

  _initEasyLoading(){
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.wave
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskType = EasyLoadingMaskType.custom
      ..indicatorSize = Dimens.size_40
      ..radius = Dimens.bigRadius
      ..contentPadding = const EdgeInsets.symmetric(horizontal: Dimens.spaLPadding, vertical: Dimens.spaMPadding)
      ..backgroundColor = AppThemesColors.current.primaryContainer
      ..indicatorColor = AppThemesColors.current.onPrimaryContainer
      ..textColor = AppThemesColors.current.onPrimaryContainer
      ..maskColor = AppThemesColors.current.surfaceDim.withOpacity(0.4)
      ..userInteractions = true
      ..dismissOnTap = false
      ..customAnimation = CustomAnimation();
  }
}
