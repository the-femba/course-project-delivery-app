import 'package:cp_delivery/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String title, String message) {
  Get.showSnackbar(GetBar(
    titleText: Text(title, style: titleStyle),
    messageText: Text(message, style: textStyle),
  ));
}
