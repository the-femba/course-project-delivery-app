import 'dart:convert';
import 'dart:typed_data';

import 'package:felix_ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flx_ui/flx_ui.dart' as flx2;

class FoodItem extends StatelessWidget {
  final int count;
  final String imageBase64;
  final String name;
  final double price;
  final flx2.FlxSplashTapCallback onMinusTap;
  final flx2.FlxSplashTapCallback onPlusTap;

  const FoodItem({
    @required this.count,
    @required this.name,
    @required this.price,
    @required this.imageBase64,
    @required this.onMinusTap,
    @required this.onPlusTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 85,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          flx2.FlxDeepCard(
            child: SizedBox(
              height: 85,
              width: 85,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.memory(
                  Uint8List.fromList(
                    base64.decode(imageBase64),
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name),
                      Text(
                        count > 1
                            ? '${price * count} x $count грн.'
                            : '$price грн.',
                        style: flx2.FlxTextTheme.caption(context).copyWith(
                          decoration: count == 0
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Row(
                      children: [
                        FlxPointButton(
                          onTap: () => onMinusTap(),
                          icon: Icons.remove,
                        ),
                        SizedBox(width: 10),
                        Text(count.toString()),
                        SizedBox(width: 10),
                        FlxPointButton(
                          onTap: () => onPlusTap(),
                          icon: Icons.add,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
