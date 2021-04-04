import 'package:cp_delivery/components/components.dart';
import 'package:cp_delivery/screens/registration_screen/registration_screen.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flx_ui/flx_ui.dart' as flx2;
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
                  TitleBar(
                    title: 'Delivery Регистрация',
                    leftButton: FlxPointButton(
                      onTap: () => Get.back(),
                      icon: Icons.arrow_back,
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: WebBox(
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    flx2.FlxTextField(
                                      controller:
                                          controller.firstNameTextController,
                                      placeholder: 'Имя',
                                    ),
                                    SizedBox(height: 15),
                                    flx2.FlxTextField(
                                      controller:
                                          controller.lastNameTextController,
                                      placeholder: 'Фамилия',
                                    ),
                                    SizedBox(height: 15),
                                    flx2.FlxTextField(
                                      controller:
                                          controller.emailTextController,
                                      placeholder: 'Email',
                                    ),
                                    SizedBox(height: 15),
                                    flx2.FlxTextField(
                                      controller:
                                          controller.passwordTextController,
                                      placeholder: 'Пароль',
                                      isConceal: true,
                                    ),
                                    SizedBox(height: 15),
                                    flx2.FlxTextField(
                                      controller: controller
                                          .repeatPasswordTextController,
                                      placeholder: 'Повтор пароля',
                                      isConceal: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          flx2.FlxSpaciousButton(
                            text: 'Зарегистрироваться',
                            onTap: () => controller.onRegistrationButtonTap(),
                          ),
                        ],
                      ),
                    ),
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
