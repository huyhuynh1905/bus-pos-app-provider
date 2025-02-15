import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/colors.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/dark_themes_custom.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/light_themes_custom.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class AppThemes{
  static ThemeData lightTheme = lightThemeData;
  static ThemeData darkTheme = darkThemeData;
}

final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.lightPrimary,
  scaffoldBackgroundColor: AppColors.lightSurface,
  textTheme: const TextTheme(
      bodyMedium: Styles.textStyleContent
  ),
)..addAppColor(AppThemeType.light,  LightThemesCustom());



final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.darkPrimary,
  scaffoldBackgroundColor: AppColors.darkSurface,
  textTheme: const TextTheme(
      bodyMedium: Styles.textStyleContent
  ),
)..addAppColor(AppThemeType.dark,  DarkThemesCustom());


enum AppThemeType { light, dark }

extension ThemeDataExtensions on ThemeData {
  static final Map<AppThemeType, AppThemesColors> _appColorMap = {};

  void addAppColor(AppThemeType type, AppThemesColors appColor) {
    _appColorMap[type] = appColor;
  }

  AppThemesColors get appThemes {
    return _appColorMap[AppThemeSetting.currentAppThemeType] ?? LightThemesCustom();
  }
}

class AppThemeSetting {
  const AppThemeSetting._();
  static AppThemeType currentAppThemeType = AppThemeType.light;
}