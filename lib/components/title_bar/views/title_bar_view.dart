import 'package:felix_ui/felix_ui.dart';
import 'package:flutter/material.dart';
import 'package:flx_ui/flx_ui.dart' as flx2;

class TitleBar extends StatelessWidget {
  final String title;
  final FlxPointButton leftButton;
  final Widget right;

  const TitleBar({
    @required this.title,
    Key key,
    this.leftButton,
    this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          leftButton ?? SizedBox(width: 50),
          Expanded(
            child: Center(
              child: Hero(
                tag: title,
                child: Text(
                  title,
                  style: flx2.FlxTextTheme.title(context),
                ),
              ),
            ),
          ),
          SizedBox(width: 50, child: right) ?? SizedBox(width: 50),
        ],
      ),
    );
  }
}
