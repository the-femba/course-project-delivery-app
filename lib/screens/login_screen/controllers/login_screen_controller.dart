import 'dart:async';

import 'package:cp_delivery/api/api.dart';
import 'package:cp_delivery/init_api.dart';
import 'package:cp_delivery/screens/screens.dart';
import 'package:cp_delivery/utils/sback_bar_util.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      var prefs = await SharedPreferences.getInstance();

      await prefs.setString('token', token.token);

      SplashScreenRouter().navigate(strategy: NavigateStrategy.deleteAll);
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
