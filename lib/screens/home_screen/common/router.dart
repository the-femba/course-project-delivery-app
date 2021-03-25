import 'package:cp_delivery/screens/home_screen/home_screen.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:get/get.dart';

class HomeScreenRouter extends FlxRouter {
  @override
  GetPage build() {
    return GetPage(
      name: '/home',
      page: () => HomeScreen(),
    );
  }
}
