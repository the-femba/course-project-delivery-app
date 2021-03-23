import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.grey[800],
      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[400]),
      strokeWidth: 2.5,
    );
  }
}
