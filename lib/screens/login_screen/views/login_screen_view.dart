import 'package:cp_delivery/common/common.dart';
import 'package:cp_delivery/components/components.dart';
import 'package:cp_delivery/screens/login_screen/login_screen.dart';
import 'package:cp_delivery/screens/registration_screen/registration_screen.dart';
import 'package:felix_ui/felix_ui.dart';
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
                  SizedBox(
                    height: 50,
                    child:
                        Center(child: Text('Delivery Вход', style: titleStyle)),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            FlxTextField(
                              placeholder: 'Email',
                              onFocusChange: (focus) {},
                              onTextChange: (TextEditingController value) =>
                                  controller.emailText = value.text,
                            ),
                            SizedBox(height: 15),
                            FlxTextField(
                              placeholder: 'Пароль',
                              isMasked: true,
                              onFocusChange: (focus) {},
                              onTextChange: (TextEditingController value) =>
                                  controller.passwordText = value.text,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  flx2.FlxSpaciousButton(
                    text: 'Войти',
                    onTap: () => controller.onLoginButtonTap(),
                    brush: flx2.FlxGlassBrush(
                      backgroundColor: Colors.blue[800],
                      isCanBlur: false,
                    ),
                  ),
                  SizedBox(height: 15),
                  FlxButton(
                    text: 'Регистрация',
                    onTap: () => RegistrationScreenRouter().navigate(),
                    color: Colors.grey[800],
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
