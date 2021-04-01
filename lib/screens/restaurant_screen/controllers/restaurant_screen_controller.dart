import 'package:cp_delivery/api/order_api_binder.dart';
import 'package:cp_delivery/api/restaurant_api_binder.dart';
import 'package:cp_delivery/screens/status_screen/status_screen.dart';
import 'package:cp_delivery/utils/utils.dart';
import 'package:get/get.dart';

class RestaurantScreenFoodInformation {
  final FoodInformation information;
  final String id;
  int count = 0;

  RestaurantScreenFoodInformation(this.id, this.information);
}

class RestaurantScreenController extends GetxController {
  final String _restaurantId;

  List<RestaurantScreenFoodInformation> _foods;

  List<RestaurantScreenFoodInformation> get foods => _foods;

  RestaurantScreenController(this._restaurantId);

  @override
  // ignore: avoid_void_async
  void onInit() async {
    var binder = RestaurantApiBinder();

    var foodsIds = await binder.getRestaurantFoodsIds(_restaurantId);

    var foodRpMap = foodsIds.map(
      (e) async => RestaurantScreenFoodInformation(
        e,
        await binder.getFoodInformation(e),
      ),
    );

    _foods = (await Future.wait(foodRpMap)).toList();

    update();

    super.onInit();
  }

  void handleMinusTap(int index) {
    if (foods[index].count - 1 < 0) {
      return;
    }

    foods[index].count--;

    update();
  }

  void handlePlusTap(int index) {
    if (foods[index].count + 1 > 10) {
      return;
    }

    foods[index].count++;

    update();
  }

  double getFoodsSum() {
    if (foods == null) {
      return 0;
    }

    var checked = foods.where((element) => element.count > 0);
    var prices = checked.map((e) => e.information.price * e.count).toList();

    return prices.fold(0, (p, e) => p + e);
  }

  // ignore: avoid_void_async
  void handleBuyTap() async {
    var selectedFoods = foods.where((e) => e.count > 0);

    if (!selectedFoods.isNotEmpty) {
      return;
    }

    List<String> foodsIds = [];

    for (var food in selectedFoods) {
      for (int i = 0; i < food.count; i++) {
        foodsIds.add(food.id);
      }
    }

    var orderId = await OrderApiBinder().createOrder(
      restaurantId: _restaurantId,
      foodsIds: foodsIds,
      token: await TokenUtil().getToken(),
    );

    Get.offAllNamed(
      StatusScreenRouter().name,
      arguments: {
        'orderId': orderId,
      },
    );
  }
}
