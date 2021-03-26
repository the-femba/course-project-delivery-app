import 'package:cp_delivery/screens/restaurant_screen/restaurant_screen.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:get/get.dart';

class RestaurantScreenRouter extends FlxRouter {
  @override
  GetPage build() {
    return GetPage(
      name: '/restaurant',
      page: () => RestaurantScreen(),
    );
  }
}
