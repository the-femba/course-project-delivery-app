import 'package:cp_delivery/screens/screens.dart';
import 'package:cp_delivery/utils/utils.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  // ignore: avoid_void_async
  void onInit() async {
    // TODO: Remove Fake
    await Future.delayed(Duration(milliseconds: 250));

    if (await TokenUtil().getToken() != null) {
      HomeScreenRouter().navigate(strategy: NavigateStrategy.deleteAll);
    } else {
      LoginScreenRouter().navigate(strategy: NavigateStrategy.deleteAll);
    }

    super.onInit();
  }
}
