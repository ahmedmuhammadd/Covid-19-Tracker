import 'dart:async';

import 'package:covid_tracker/View/world_state.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/covid_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String splashScreen = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat();

  @override
  void initState() {
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushNamed(context, WorldStateScreen.worldStateScreen),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CovidImageWidget(
              controller: _controller,
            ),
            const SizedBox(height: 40),
            const Text(
              'COVID-19\n TRACKER APP ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35),
            )
          ],
        ),
      ),
    );
  }
}
