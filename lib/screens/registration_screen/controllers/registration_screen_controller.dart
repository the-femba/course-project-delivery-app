import 'package:cp_delivery/utils/utils.dart';
import 'package:get/get.dart';

class RegistrationScreenController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future onRegistrationButtonTap() async {
    // TODO: Add True logic
    // TODO: Remove Fakes

    _isLoading = true;
    update();

    await Future.delayed(Duration(seconds: 1));
    _isLoading = false;
    update();

    showSnackbar('Ошибка', 'Не удается зарегистрироваться');
  }
}
