import 'package:cp_delivery/screens/login_screen/login_screen.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class LoginScreenRouter extends FlxRouter {
  @override
  GetPage build() {
    return GetPage(
      name: '/login',
      page: () => LoginScreen(),
    );
  }
}
