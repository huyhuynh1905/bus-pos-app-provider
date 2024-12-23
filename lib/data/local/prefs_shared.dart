import 'package:bus_pos_app/data/local/prefs_shared_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
 * Created by DinhTC on 26/01/2024.
 * Company UNIT
 * Code is not just a tool; it's the art of turning ideas into reality.
 */

class PrefsShared {
  PrefsShared(this._sharedPreference);

  final SharedPreferences _sharedPreference;

  //language code
  String get languageCode => _sharedPreference.getString(PrefsSharedKey.keyLanguageCode) ?? 'vi';

  Future<bool> saveLanguageCode(String languageCode) {
    return _sharedPreference.setString(PrefsSharedKey.keyLanguageCode, languageCode);
  }
}
