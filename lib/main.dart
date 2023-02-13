import 'package:covid_tracker/View/splash_screen.dart';
import 'package:flutter/material.dart';

import 'View/countries_screen.dart';
import 'View/detailed_country.dart';
import 'View/world_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.splashScreen: (context) => const SplashScreen(),
        WorldStateScreen.worldStateScreen: (context) =>
            const WorldStateScreen(),
        SearchCountryScreen.searchCountryScreen: (context) =>
            const SearchCountryScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
