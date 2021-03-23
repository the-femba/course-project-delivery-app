import 'dart:async';

import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void onLoginButtonTap() {
    // TODO: Add True logic
    // TODO: Remove Fakes

    _isLoading = true;
    update();

    Timer(Duration(milliseconds: 250), () {
      _isLoading = false;
      update();
    });
  }

  void onRegistrationButtonTap() {}
}
