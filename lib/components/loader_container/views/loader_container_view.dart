import 'package:cp_delivery/components/components.dart';
import 'package:flutter/material.dart';

class LoaderContainer extends StatelessWidget {
  final double progress;
  final bool isLoading;
  final Widget child;

  const LoaderContainer({
    Key key,
    this.progress,
    this.isLoading,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading ?? false)
          Positioned(
            child: Container(
              color: Colors.white10,
              child: Center(child: Loader(progress: progress)),
            ),
          )
        else
          SizedBox(),
      ],
    );
  }
}
