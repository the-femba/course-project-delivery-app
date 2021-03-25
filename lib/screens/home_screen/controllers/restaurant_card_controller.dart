import 'package:cp_delivery/api/restaurant_api_binder.dart';
import 'package:get/get.dart';

class RestaurantCardController extends GetxController {
  final String id;

  RestaurantInformation _information;
  RestaurantInformation get information => _information;

  RestaurantCardController(this.id);

  @override
  void onInit() async {
    var binder = RestaurantApiBinder();

    _information = await binder.getRestaurantInformation(id);

    update();

    super.onInit();
  }
}
