import 'dart:async';

import 'package:cp_delivery/api/order_api_binder.dart';
import 'package:cp_delivery/screens/screens.dart';
import 'package:cp_delivery/utils/utils.dart';
import 'package:get/get.dart';

class StatusScreenController extends GetxController {
  OrderStatus _orderStatus = OrderStatus.searchForCourier;
  OrderStatus get orderStatus => _orderStatus;

  final String orderId;

  StatusScreenController(this.orderId);

  Timer _timer;

  @override
  void onInit() {
    _timer = Timer.periodic(
      Duration(seconds: 3),
      (timer) async {
        _orderStatus = await OrderApiBinder().getOrderStatus(
          orderId: orderId,
          token: await TokenUtil().getToken(),
        );

        update();

        if (_orderStatus == OrderStatus.done ||
            _orderStatus == OrderStatus.cancel) {
          SplashScreenRouter().navigate();
        }
      },
    );

    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
