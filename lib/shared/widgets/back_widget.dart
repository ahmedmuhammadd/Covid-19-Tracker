import 'package:covid_tracker/View/world_state.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final String navigation;

  const BackButtonWidget({required this.navigation, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, navigation, (route) => true);
          },
          child: const Text(
            'Back',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
