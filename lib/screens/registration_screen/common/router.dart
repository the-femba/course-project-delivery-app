import 'package:cp_delivery/screens/registration_screen/registration_screen.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RegistrationScreenRouter extends FlxRouter {
  @override
  GetPage build() {
    return GetPage(
      name: '/registration',
      page: () => RegistrationScreen(),
    );
  }
}
