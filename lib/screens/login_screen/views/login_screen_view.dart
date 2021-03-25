import 'package:cp_delivery/components/components.dart';
import 'package:cp_delivery/screens/login_screen/login_screen.dart';
import 'package:cp_delivery/screens/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flx_ui/flx_ui.dart' as flx2;
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
      init: LoginScreenController(),
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
                    title: 'Delivery Вход',
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            flx2.FlxTextField(
                              controller: controller.emailTextController,
                              placeholder: 'Email',
                            ),
                            SizedBox(height: 15),
                            flx2.FlxTextField(
                              controller: controller.passwordTextController,
                              placeholder: 'Пароль',
                              isConceal: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  flx2.FlxSpaciousButton(
                    text: 'Войти',
                    onTap: () => controller.onLoginButtonTap(),
                  ),
                  SizedBox(height: 15),
                  flx2.FlxSpaciousButton(
                    text: 'Регистрация',
                    onTap: () => RegistrationScreenRouter().navigate(),
                    backgroundColor: Colors.grey[800],
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
