import 'package:cp_delivery/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flx_ui/flx_ui.dart';
import 'package:get/get.dart';

import 'init_api.dart';

void main() {
  initApi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery',
      darkTheme: flxDarkTheme(),
      themeMode: ThemeMode.dark,
      getPages: [
        SplashScreenRouter().build(),
        LoginScreenRouter().build(),
        RegistrationScreenRouter().build(),
        HomeScreenRouter().build(),
        RestaurantScreenRouter().build(),
      ],
      initialRoute: SplashScreenRouter().name,
    );
  }
}
