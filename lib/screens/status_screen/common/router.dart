import 'package:cp_delivery/screens/screens.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:get/get.dart';

class StatusScreenRouter extends FlxRouter {
  @override
  GetPage build() {
    return GetPage(
      name: '/order_status',
      page: () => StatusScreen(),
    );
  }
}
