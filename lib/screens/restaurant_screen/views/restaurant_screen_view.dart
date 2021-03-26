import 'dart:convert';
import 'dart:typed_data';

import 'package:cp_delivery/components/components.dart';
import 'package:felix_ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flx_ui/flx_ui.dart' as flx2;
import 'package:get/get.dart';

class RestaurantScreen extends StatelessWidget {
  final title = Get.arguments['title'] as String;
  final backwardPhotoBase64 = Get.arguments['backwardPhotoBase64'] as String;
  final logoPhotoBase64 = Get.arguments['logoPhotoBase64'] as String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          flx2.FlxDeepCard(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Image.memory(
                    Uint8List.fromList(
                      base64.decode(backwardPhotoBase64),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: flx2.FlxGlassContainer(
                    borderRadius: BorderRadius.circular(11),
                    brush: flx2.FlxGlassBrush(
                      depth: 0.2,
                      color: Colors.grey[900],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 15.0 + MediaQuery.of(context).viewPadding.top,
                    left: 25,
                    right: 25,
                    bottom: 15,
                  ),
                  child: TitleBar(
                    leftButton: FlxPointButton(
                      icon: Icons.arrow_back,
                      onTap: () => Get.back(),
                    ),
                    title: title,
                    right: Image.memory(
                      Uint8List.fromList(
                        base64.decode(logoPhotoBase64),
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
