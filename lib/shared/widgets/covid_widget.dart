import 'package:flutter/material.dart';
import 'dart:math' as math;

class CovidImageWidget extends StatelessWidget {
  final AnimationController controller;

  const CovidImageWidget({Key? key, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: const Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image(
            image: AssetImage('images/virus.png'),
          ),
        ),
      ),
      animation: controller,
      builder: (context, Widget? child) {
        return Transform.rotate(
          angle: controller.value * 10,
          child: child,
        );
      },
    );
  }
}
