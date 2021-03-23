import 'package:cp_delivery/screens/splash_screen/splash_screen.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashScreenRouter extends FlxRouter {
  @override
  GetPage build() {
    return GetPage(
      name: '/',
      page: () => SplashScreen(),
    );
  }
}
