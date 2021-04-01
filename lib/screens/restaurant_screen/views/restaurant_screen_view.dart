import 'dart:convert';
import 'dart:typed_data';

import 'package:cp_delivery/components/components.dart';
import 'package:cp_delivery/screens/restaurant_screen/restaurant_screen.dart';
import 'package:cp_delivery/screens/screens.dart';
import 'package:felix_ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flx_ui/flx_ui.dart' as flx2;
import 'package:get/get.dart';

class RestaurantScreen extends StatelessWidget {
  final title = Get.arguments['title'] as String;
  final backwardPhotoBase64 = Get.arguments['backwardPhotoBase64'] as String;
  final logoPhotoBase64 = Get.arguments['logoPhotoBase64'] as String;
  final restaurantId = Get.arguments['restaurantId'] as String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RestaurantScreenController>(
        init: RestaurantScreenController(restaurantId),
        builder: (controller) => Column(
          children: [
            flx2.FlxDeepCard(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Image.memory(
                      Uint8List.fromList(
                        base64.decode(backwardPhotoBase64),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: flx2.FlxGlassContainer(
                      borderRadius: BorderRadius.circular(11),
                      brush: flx2.FlxGlassBrush(
                        depth: 0.2,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0 + MediaQuery.of(context).viewPadding.top,
                      left: 25,
                      right: 25,
                      bottom: 15,
                    ),
                    child: TitleBar(
                      leftButton: FlxPointButton(
                        icon: Icons.arrow_back,
                        onTap: () => Get.back(),
                      ),
                      title: title,
                      right: Image.memory(
                        Uint8List.fromList(
                          base64.decode(logoPhotoBase64),
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: controller.foods != null
                  ? buildFoodsList(controller)
                  : Center(child: Loader()),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 25,
                top: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Сумма: ${controller.getFoodsSum()} грн.'),
                  SizedBox(height: 10),
                  flx2.FlxSpaciousButton(
                    text: 'Купить',
                    onTap: () => controller.handleBuyTap(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFoodsList(RestaurantScreenController controller) {
    return ListView.builder(
      itemCount: controller.foods != null ? controller.foods.length : 0,
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FoodItem(
          count: controller.foods[index].count,
          price: controller.foods[index].information.price,
          name: controller.foods[index].information.name,
          imageBase64: controller.foods[index].information.foodPhotoBase64,
          onMinusTap: () => controller.handleMinusTap(index),
          onPlusTap: () => controller.handlePlusTap(index),
        ),
      ),
    );
  }
}
