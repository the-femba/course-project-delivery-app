import 'dart:async';

import 'package:cp_delivery/api/api.dart';
import 'package:cp_delivery/utils/sback_bar_util.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String passwordText = '';

  String emailText = '';

  Future onLoginButtonTap() async {
    _isLoading = true;
    update();

    try {
      var authApiBinder = AuthApiBinder();
      var token = await authApiBinder.singUp(
        email: emailText,
        password: passwordText,
      );

      showSnackbar('Успешно', 'Ваш токен это ${token.token}');
    } on ApiException catch (e) {
      showSnackbar('Ошибка', 'Не удается войти в аккаунт');
    }

    _isLoading = false;
    update();
  }
}
