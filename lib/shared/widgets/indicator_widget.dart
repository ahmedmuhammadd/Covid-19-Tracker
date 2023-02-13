import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IndicatorWidget extends StatelessWidget {
  final AnimationController animationController;

  const IndicatorWidget({
    required this.animationController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: Colors.white,
        controller: animationController,
        size: 50.0,
      ),
    );
  }
}
