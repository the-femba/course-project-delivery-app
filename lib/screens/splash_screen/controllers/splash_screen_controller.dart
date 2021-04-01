import 'package:cp_delivery/api/order_api_binder.dart';
import 'package:cp_delivery/screens/screens.dart';
import 'package:cp_delivery/utils/utils.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  // ignore: avoid_void_async
  void onInit() async {
    // TODO: Remove Fake
    await Future.delayed(Duration(milliseconds: 250));

    var token = await TokenUtil().getToken();
    if (token != null) {
      var currentOrder =
          await OrderApiBinder().getUserCurrentOrderId(token: token);

      if (currentOrder == null) {
        HomeScreenRouter().navigate(strategy: NavigateStrategy.deleteAll);
      } else {
        Get.offAllNamed(
          StatusScreenRouter().name,
          arguments: {
            'orderId': currentOrder,
          },
        );
      }
    } else {
      LoginScreenRouter().navigate(strategy: NavigateStrategy.deleteAll);
    }

    super.onInit();
  }
}
