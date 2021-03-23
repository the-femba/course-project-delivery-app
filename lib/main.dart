import 'package:cp_delivery/screens/screens.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery',
      darkTheme: FlxTheme.dark().data,
      themeMode: ThemeMode.dark,
      getPages: [
        SplashScreenRouter().build(),
        LoginScreenRouter().build(),
      ],
      initialRoute: SplashScreenRouter().name,
    );
  }
}
