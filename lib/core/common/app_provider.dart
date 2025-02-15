import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/app_themes.dart';

class AppProvider extends BaseViewModel {

  String appLanguageCode = "vi";
  bool isDarkThemes = false;

  init() {
    //themes
    isDarkThemes = prefShared.isDarkMode;
    AppThemeSetting.currentAppThemeType = isDarkThemes ? AppThemeType.dark : AppThemeType.light;
  }

  onChangesThemes(){
    if(isDarkThemes){
      isDarkThemes = false;
      AppThemeSetting.currentAppThemeType = AppThemeType.light;
    } else {
      isDarkThemes = true;
      AppThemeSetting.currentAppThemeType = AppThemeType.dark;
    }
    prefShared.saveThemes(isDarkThemes);
    notifyListeners();
  }
}
