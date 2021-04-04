import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WebBox extends StatelessWidget {
  final Widget child;

  const WebBox({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isWeb
        ? Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 750,
                maxHeight: 1000,
              ),
              child: child,
            ),
          )
        : child;
  }
}
