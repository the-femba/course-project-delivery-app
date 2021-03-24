import 'dart:async';

import 'package:cp_delivery/api/api.dart';
import 'package:cp_delivery/init_api.dart';
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
    } on NotExistsDeliveryException catch (e) {
      showSnackbar(
          'Не удалось войти', 'Перепроверьте ваши данные и попробуйте снова');
    } on Exception catch (e) {
      showSnackbar('Ошибка', 'Произошла неизвестная ошибка');
    }

    _isLoading = false;
    update();
  }
}
