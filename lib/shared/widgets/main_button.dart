import 'package:flutter/material.dart';

import '../../View/countries_screen.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SearchCountryScreen.searchCountryScreen);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: const Center(
          child:
              Text('Track countries ', style: TextStyle(color: Colors.white)),
        ),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff1aa260),
        ),
      ),
    );
  }
}
