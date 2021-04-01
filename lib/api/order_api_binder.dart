import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api_service.dart';

enum OrderStatus {
  searchForCourier,
  courierGoesToRestaurant,
  courierCameToRestaurant,
  restaurantPreparesFood,
  restaurantPreparedFood,
  courierGoesToCustomer,
  done,
  cancel,
}

final Map<int, OrderStatus> orderStatusApiMap = {
  0: OrderStatus.searchForCourier,
  1: OrderStatus.courierGoesToRestaurant,
  2: OrderStatus.courierCameToRestaurant,
  3: OrderStatus.restaurantPreparesFood,
  5: OrderStatus.restaurantPreparedFood,
  6: OrderStatus.courierGoesToCustomer,
  -1: OrderStatus.done,
  -2: OrderStatus.cancel
};

class OrderApiBinder {
  final _apiService = Get.find<ApiService>();

  Future<String> createOrder({
    @required String restaurantId,
    @required List<String> foodsIds,
    @required String token,
  }) async {
    var result = await _apiService.send(
      '/v1/order/createOrder',
      RequestType.post,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'restaurantId': restaurantId,
        'foodsIds': foodsIds,
      },
    );

    return result['createdOrderId'] as String;
  }

  Future<OrderStatus> getOrderStatus({
    @required String orderId,
    @required String token,
  }) async {
    var result = await _apiService.send(
      '/v1/order/getOrderStatusQuery',
      RequestType.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
      query: {
        'orderId': orderId,
      },
    );

    print(result);

    return orderStatusApiMap[result['orderStatus'] as int];
  }

  Future<String> getUserCurrentOrderId({
    @required String token,
  }) async {
    var result = await _apiService.send(
      '/v1/order/getUserOrderIdIfHasItQuery',
      RequestType.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    return result['orderId'] as String;
  }
}
