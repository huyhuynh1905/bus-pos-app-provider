import 'package:bus_pos_app/data/local/prefs_shared_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsShared {
  PrefsShared(this._sharedPreference);

  final SharedPreferences _sharedPreference;

  //language code
  String get languageCode => _sharedPreference.getString(PrefsSharedKey.keyLanguageCode) ?? 'vi';

  Future<bool> saveLanguageCode(String languageCode) {
    return _sharedPreference.setString(PrefsSharedKey.keyLanguageCode, languageCode);
  }

  bool get isDarkMode => _sharedPreference.getBool(PrefsSharedKey.keyThemesMode) ?? false;

  Future<bool> saveThemes(bool isDarkMode) {
    return _sharedPreference.setBool(PrefsSharedKey.keyThemesMode, isDarkMode);
  }

  Future<void> deleteAll() async {
    await _sharedPreference.clear();
  }
}
