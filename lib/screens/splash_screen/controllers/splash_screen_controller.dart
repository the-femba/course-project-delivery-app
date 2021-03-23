import 'dart:async';

import 'package:cp_delivery/screens/login_screen/login_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: Remove Fake
    Timer(
      Duration(seconds: 1),
      () => routeByloginStatus(),
    );

    super.onInit();
  }

  void routeByloginStatus() {
    // TODO: Add logic
    LoginScreenRouter().navigate();
  }
}
