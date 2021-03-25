import 'package:cp_delivery/api/auth_api_binder.dart';
import 'package:cp_delivery/screens/splash_screen/common/router.dart';
import 'package:cp_delivery/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:felix_ui/routers/navigate_strategy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../init_api.dart';

class RegistrationScreenController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();

  Future onRegistrationButtonTap() async {
    _isLoading = true;
    update();

    // TODO: Remove Fake
    await Future.delayed(Duration(milliseconds: 250));

    try {
      var authApiBinder = AuthApiBinder();

      await authApiBinder.singIn(
        firstName: firstNameTextController.text.trim().toLowerCase(),
        lastName: lastNameTextController.text.trim().toLowerCase(),
        email: emailTextController.text.trim(),
        password: passwordTextController.text,
      );

      var singUpResult = await authApiBinder.singUp(
        email: emailTextController.text.trim(),
        password: passwordTextController.text,
      );

      var prefs = await SharedPreferences.getInstance();

      await prefs.setString('token', singUpResult.token);

      SplashScreenRouter().navigate(strategy: NavigateStrategy.deleteAll);
    } on ExistsDeliveryException catch (e) {
      showSnackbar(
        'Такой аккаунт уже существует',
        'Попробуйте изменить email или войдите в ваш аккаунт',
      );
    } on ValidationException catch (e) {
      showSnackbar(
        'Неправильный формат',
        'Проверьте формат введенных данных',
      );
    } on DioError {
      showSnackbar('Ошибка', 'Проверьте подключение к интернету');
    } on Exception catch (e) {
      showSnackbar(
        'Ошибка',
        'Произошла неизвестная ошибка',
      );
    }

    _isLoading = false;
    update();
  }
}
