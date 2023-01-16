import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static  SharedPrefsService? _instance;
  static  SharedPreferences? _preferences;

  static const String IS_AUTH = 'is_auth';
  static const String USER_DETAILS = 'user_details';

  static Future<SharedPrefsService> getInstance() async {
    _instance ??= SharedPrefsService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  dynamic read(String key) {
    var value = _preferences?.get(key);
    print('(TRACE) SharePrefsService read: key: $key value: $value');
    return value;
  }

  void write<T>(String key, T content) {
    print('(TRACE) SharePrefsService write: key: $key value: $content');

    if (content is String) {
      _preferences?.setString(key, content);
    }
    if (content is bool) {
      _preferences?.setBool(key, content);
    }
    if (content is int) {
      _preferences?.setInt(key, content);
    }
    if (content is double) {
      _preferences?.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences?.setStringList(key, content);
    }
  }

  void clear() {
    _preferences?.remove(IS_AUTH);
  }
}
