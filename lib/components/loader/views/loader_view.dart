import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double progress;

  const Loader({
    Key key,
    this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey[800],
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[400]),
        strokeWidth: 2.5,
        value: progress,
      ),
    );
  }
}
