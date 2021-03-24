import 'package:cp_delivery/api/auth_api_binder.dart';
import 'package:cp_delivery/screens/splash_screen/common/router.dart';
import 'package:cp_delivery/utils/utils.dart';
import 'package:felix_ui/routers/navigate_strategy.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../init_api.dart';

class RegistrationScreenController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String firstNameText = '';
  String lastNameText = '';
  String emailText = '';
  String passwordText = '';
  String repeatPasswordText = '';

  Future onRegistrationButtonTap() async {
    _isLoading = true;
    update();

    try {
      var authApiBinder = AuthApiBinder();

      await authApiBinder.singIn(
        firstName: firstNameText.trim().toLowerCase(),
        lastName: lastNameText.trim().toLowerCase(),
        email: emailText.trim(),
        password: passwordText,
      );

      var singUpResult = await authApiBinder.singUp(
        email: emailText.trim(),
        password: passwordText,
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
