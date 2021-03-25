import 'package:shared_preferences/shared_preferences.dart';

class TokenUtil {
  Future<String> getToken() async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getString('token');
  }
}
