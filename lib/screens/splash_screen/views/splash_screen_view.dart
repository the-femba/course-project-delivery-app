import 'package:cp_delivery/components/components.dart';
import 'package:cp_delivery/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (controller) => Scaffold(
        body: Center(
          child: Loader(),
        ),
      ),
    );
  }
}
