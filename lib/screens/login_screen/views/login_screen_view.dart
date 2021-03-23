import 'package:cp_delivery/common/common.dart';
import 'package:cp_delivery/screens/login_screen/login_screen.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
      init: LoginScreenController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 15,
                  ),
                  child:
                      Center(child: Text('Delivery Вход', style: titleStyle)),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlxTextField(placeholder: 'Email'),
                      SizedBox(height: 15),
                      FlxTextField(placeholder: 'Пароль', isMasked: true),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                FlxButton(
                  text: 'Войти',
                  onTap: () => controller.onLoginButtonTap(),
                ),
                SizedBox(height: 15),
                FlxButton(
                  text: 'Зарегистрироваться',
                  onTap: () => controller.onRegistrationButtonTap(),
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
