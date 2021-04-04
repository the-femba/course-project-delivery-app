import 'package:cp_delivery/components/components.dart';
import 'package:cp_delivery/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 25,
                right: 25,
              ),
              child: TitleBar(
                title: 'Delivery Рестораны',
              ),
            ),
            Expanded(
              child: WebBox(
                child: GetBuilder<HomeScreenController>(
                  init: HomeScreenController(),
                  builder: (controller) => controller.restaurantsIds != null
                      ? buildList(controller)
                      : Center(child: Loader()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildList(HomeScreenController controller) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      itemCount: controller.restaurantsIds.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: RestaurantCard(
          restaurantId: controller.restaurantsIds[index],
        ),
      ),
    );
  }
}
