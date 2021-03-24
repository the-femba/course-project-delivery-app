import 'package:cp_delivery/screens/login_screen/login_screen.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  // ignore: avoid_void_async
  void onInit() async {
    var prefs = await SharedPreferences.getInstance();

    // TODO: Remove Fake
    await Future.delayed(Duration(milliseconds: 250));

    if (prefs.getString('token') != null) {
      // TODO: Delete in release
      LoginScreenRouter().navigate(strategy: NavigateStrategy.deleteAll);
    } else {
      LoginScreenRouter().navigate(strategy: NavigateStrategy.deleteAll);
    }

    super.onInit();
  }
}
