import 'dart:convert';
import 'dart:typed_data';

import 'package:cp_delivery/components/components.dart';
import 'package:cp_delivery/screens/home_screen/controllers/restaurant_card_controller.dart';
import 'package:cp_delivery/screens/restaurant_screen/common/router.dart';
import 'package:flutter/material.dart';
import 'package:flx_ui/flx_ui.dart' as flx2;
import 'package:get/get.dart';

class RestaurantCard extends StatelessWidget {
  final String restaurantId;

  const RestaurantCard({
    @required this.restaurantId,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: flx2.FlxDeepCard(
        child: GetBuilder<RestaurantCardController>(
          init: RestaurantCardController(restaurantId),
          global: false,
          builder: (controller) => controller.information != null
              ? buildContent(context, controller)
              : Center(child: Loader()),
        ),
      ),
    );
  }

  Widget buildContent(
      BuildContext context, RestaurantCardController controller) {
    return flx2.FlxSplash(
      onTap: () => Get.toNamed(
        RestaurantScreenRouter().name,
        arguments: {
          'title': controller.information.name,
          'backwardPhotoBase64': controller.information.backwardPhotoBase64,
          'logoPhotoBase64': controller.information.logoPhotoBase64,
        },
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.memory(
                Uint8List.fromList(
                  base64.decode(controller.information.backwardPhotoBase64),
                ),
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: flx2.FlxGlassContainer(
                borderRadius: BorderRadius.circular(0),
                brush: flx2.FlxGlassBrush(
                  depth: 0.1,
                  color: flx2.FlxColorTheme.primary(context),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.memory(
                            Uint8List.fromList(
                              base64.decode(
                                  controller.information.logoPhotoBase64),
                            ),
                            fit: BoxFit.contain,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                    ),
                    flx2.FlxFlatCard(
                      brush: flx2.FlxGlassBrush(
                        depth: 0.25,
                        color: flx2.FlxColorTheme.primary(context),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Hero(
                                tag: controller.information.name,
                                flightShuttleBuilder: (
                                  BuildContext flightContext,
                                  Animation<double> animation,
                                  HeroFlightDirection flightDirection,
                                  BuildContext fromHeroContext,
                                  BuildContext toHeroContext,
                                ) =>
                                    Text(
                                  controller.information.name,
                                  style: flx2.FlxTextTheme.title(context),
                                ),
                                child: Text(
                                  controller.information.name,
                                  style: flx2.FlxTextTheme.subtitle(context),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                controller.information.description,
                                style: flx2.FlxTextTheme.caption(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
