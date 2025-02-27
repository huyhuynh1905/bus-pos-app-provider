import 'package:bus_pos_app/data/local/storage_shared/prefs_shared_key.dart';
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

  Future<bool> saveTimeLastSyncUTC(String lastSync) {
    return _sharedPreference.setString(PrefsSharedKey.keyLastSyncTimeUTC, lastSync);
  }

  String get lastSyncDateUTC => _sharedPreference.getString(PrefsSharedKey.keyLastSyncTimeUTC) ?? '';

  Future<bool> saveTimeLastSync(String lastSync) {
    return _sharedPreference.setString(PrefsSharedKey.keyLastSyncTime, lastSync);
  }

  String get lastSyncDate => _sharedPreference.getString(PrefsSharedKey.keyLastSyncTime) ?? '';

  Future<bool> saveIsBlockScreen(bool isBlockScreen) {
    return _sharedPreference.setBool(PrefsSharedKey.keyIsBlockScreen, isBlockScreen);
  }

  bool get isBlockScreen => _sharedPreference.getBool(PrefsSharedKey.keyIsBlockScreen) ?? false;

  Future<bool> saveIsSynced(bool isSynced) {
    return _sharedPreference.setBool(PrefsSharedKey.keyIsSynced, isSynced);
  }

  bool get isSynced => _sharedPreference.getBool(PrefsSharedKey.keyIsSynced) ?? false;


  Future<void> deleteAll() async {
    await _sharedPreference.clear();
  }
}
