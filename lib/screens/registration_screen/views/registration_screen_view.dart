import 'package:cp_delivery/common/common.dart';
import 'package:cp_delivery/components/components.dart';
import 'package:cp_delivery/screens/registration_screen/registration_screen.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationScreenController>(
      init: RegistrationScreenController(),
      builder: (controller) => Scaffold(
        body: LoaderContainer(
          isLoading: controller.isLoading,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 15,
                bottom: 25,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        FlxPointButton(
                          onTap: () => Get.back(),
                          icon: Icons.arrow_back,
                        ),
                        Expanded(
                          child: Center(
                            child:
                                Text('Delivery Регистрация', style: titleStyle),
                          ),
                        ),
                        SizedBox(width: 50, height: 50),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            FlxTextField(placeholder: 'Email'),
                            SizedBox(height: 15),
                            FlxTextField(placeholder: 'Имя'),
                            SizedBox(height: 15),
                            FlxTextField(placeholder: 'Фамилия'),
                            SizedBox(height: 15),
                            FlxTextField(placeholder: 'Пароль', isMasked: true),
                            SizedBox(height: 15),
                            FlxTextField(
                                placeholder: 'Повтор пароля', isMasked: true),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  FlxButton(
                    text: 'Зарегистрироваться',
                    onTap: () => controller.onRegistrationButtonTap(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
