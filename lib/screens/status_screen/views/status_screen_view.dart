import 'package:cp_delivery/api/order_api_binder.dart';
import 'package:cp_delivery/components/components.dart';
import 'package:cp_delivery/screens/status_screen/controllers/status_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flx_ui/components/components.dart';
import 'package:flx_ui/flx_ui.dart';
import 'package:get/get.dart';

class StatusScreen extends StatelessWidget {
  final orderId = Get.arguments['orderId'] as String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TitleBar(title: 'Статус заказа'),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: GetBuilder<StatusScreenController>(
                      init: StatusScreenController(orderId),
                      builder: (controller) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StepByStep(
                            step: 1,
                            isTarget: controller.orderStatus ==
                                OrderStatus.searchForCourier,
                            text: 'Поиск курьера',
                          ),
                          StepDivider(),
                          StepByStep(
                            step: 2,
                            isTarget: controller.orderStatus ==
                                OrderStatus.courierGoesToRestaurant,
                            text: 'Курьер идет в ресторан',
                          ),
                          StepDivider(),
                          StepByStep(
                            step: 3,
                            isTarget: controller.orderStatus ==
                                OrderStatus.courierCameToRestaurant,
                            text: 'Курьер пришел в ресторан',
                          ),
                          StepDivider(),
                          StepByStep(
                            step: 4,
                            isTarget: controller.orderStatus ==
                                OrderStatus.restaurantPreparedFood,
                            text: 'Ресторан готовит еду',
                          ),
                          StepDivider(),
                          StepByStep(
                            step: 5,
                            isTarget: controller.orderStatus ==
                                OrderStatus.restaurantPreparesFood,
                            text: 'Ресторан приготовил еду',
                          ),
                          StepDivider(),
                          StepByStep(
                            step: 6,
                            isTarget: controller.orderStatus ==
                                OrderStatus.courierGoesToCustomer,
                            text: 'Курьер несет еду заказчику',
                          ),
                          StepDivider(),
                          StepByStep(
                            step: 7,
                            isTarget:
                                controller.orderStatus == OrderStatus.done,
                            text: 'Заказ доставлен',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Text('Осталось 15 минут'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StepByStep extends StatelessWidget {
  final int step;
  final bool isTarget;
  final String text;

  const StepByStep({
    @required this.step,
    @required this.text,
    this.isTarget = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: [
          FlxDeepCard(
            borderRadius: BorderRadius.circular(200),
            brush: FlxGlassBrush(
              depth: 1,
              color: isTarget
                  ? FlxColorTheme.accent(context)
                  : FlxColorTheme.primary(context),
            ),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Center(
                child: Text(
                  step.toString(),
                  style: FlxTextTheme.subtitle(context).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(
            text,
            style: FlxTextTheme.text(context).copyWith(
              color: !isTarget ? Colors.grey : FlxTextTheme.text(context).color,
            ),
          ),
        ],
      ),
    );
  }
}

class StepDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.5),
      child: FlxFlatCard(
        child: SizedBox(
          width: 5,
          height: 30,
        ),
      ),
    );
  }
}
