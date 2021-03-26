import 'package:cp_delivery/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantInformation {
  final String name;
  final String description;
  final String logoPhotoBase64;
  final String backwardPhotoBase64;

  RestaurantInformation({
    @required this.name,
    @required this.description,
    @required this.logoPhotoBase64,
    @required this.backwardPhotoBase64,
  });

  RestaurantInformation.fromJson(Map<String, dynamic> json)
      : name = json['information']['name'] as String,
        description = json['information']['description'] as String,
        logoPhotoBase64 = json['photosData']['logoPhotoBase64'] as String,
        backwardPhotoBase64 =
            json['photosData']['backwardPhotoBase64'] as String;
}

class FoodInformation {
  final String name;
  final double price;
  final String foodPhotoBase64;

  FoodInformation({
    @required this.name,
    @required this.foodPhotoBase64,
    @required this.price,
  });

  FoodInformation.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        price = json['priceGrn'].roundToDouble() as double,
        foodPhotoBase64 = json['foodPhotoBase64'] as String;
}

class RestaurantApiBinder {
  final _apiService = Get.find<ApiService>();

  Future<List<String>> getYourRecommendedRestaurantsIds({
    @required String token,
    @required int offset,
    @required int count,
  }) async {
    var result = await _apiService.send(
      '/v1/restaurant/getRecomendedForUser',
      RequestType.get,
      query: {
        'offset': offset,
        'count': count,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    var dResult = result['recommendedRestaurantsIds'] as List<dynamic>;

    return dResult.map((e) => e as String).toList();
  }

  Future<RestaurantInformation> getRestaurantInformation(String id) async {
    var result = await _apiService.send(
      '/v1/restaurant/getInformation',
      RequestType.get,
      query: {
        'id': id,
      },
    );

    return RestaurantInformation.fromJson(result);
  }

  Future<List<String>> getRestaurantFoodsIds(String id) async {
    var result = await _apiService.send(
      '/v1/restaurant/getRestaurantsFoods',
      RequestType.get,
      query: {
        'id': id,
      },
    );

    var dResult = result['restaurantFoodsIds'] as List<dynamic>;

    return dResult.map((e) => e as String).toList();
  }

  Future<FoodInformation> getFoodInformation(String id) async {
    var result = await _apiService.send(
      '/v1/restaurant/getFoodInformation',
      RequestType.get,
      query: {
        'id': id,
      },
    );

    return FoodInformation.fromJson(result);
  }
}
