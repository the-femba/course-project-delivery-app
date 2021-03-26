import 'package:cp_delivery/api/restaurant_api_binder.dart';
import 'package:get/get.dart';

class RestaurantScreenFoodInformation {
  final FoodInformation information;
  int count = 0;

  RestaurantScreenFoodInformation(this.information);
}

class RestaurantScreenController extends GetxController {
  final String _restaurantId;

  List<RestaurantScreenFoodInformation> _foods;
  List<RestaurantScreenFoodInformation> get foods => _foods;

  RestaurantScreenController(this._restaurantId);

  @override
  void onInit() async {
    var binder = RestaurantApiBinder();

    var foodsIds = await binder.getRestaurantFoodsIds(_restaurantId);

    var foodRpMap = foodsIds.map(
      (e) async => RestaurantScreenFoodInformation(
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
}
