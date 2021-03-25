import 'package:cp_delivery/api/restaurant_api_binder.dart';
import 'package:cp_delivery/utils/utils.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  List<String> _restaurantsIds;

  List<String> get restaurantsIds => _restaurantsIds;

  @override
  // ignore: avoid_void_async
  void onInit() async {
    var binder = RestaurantApiBinder();

    _restaurantsIds = await binder.getYourRecommendedRestaurantsIds(
      token: await TokenUtil().getToken(),
      offset: 0,
      count: 100,
    );

    update();

    super.onInit();
  }
}
