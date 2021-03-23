import 'dart:async';

import 'package:cp_delivery/screens/registration_screen/registration_screen.dart';
import 'package:cp_delivery/utils/sback_bar_util.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future onLoginButtonTap() async {
    // TODO: Add True logic
    // TODO: Remove Fakes

    _isLoading = true;
    update();

    await Future.delayed(Duration(seconds: 1));
    _isLoading = false;
    update();

    showSnackbar('Ошибка', 'Не удается войти в аккаунт');
  }

  void onRegistrationButtonTap() {
    RegistrationScreenRouter().navigate();
  }
}
