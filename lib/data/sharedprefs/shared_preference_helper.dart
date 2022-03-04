import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  SharedPreferenceHelper({
    required this.prefs,
  });

  static const String token = 'Token';
  final SharedPreferences prefs;

  Future<void> setUserToken({required String userToken}) async =>
      prefs.setString(token, userToken);

  String? getUserToken() {
    final userToken = prefs.getString(token);
    return userToken;
  }
}
