import 'package:covid_tracker/View/countries_screen.dart';
import 'package:covid_tracker/shared/widgets/back_widget.dart';
import 'package:covid_tracker/shared/widgets/county_info.dart';
import 'package:covid_tracker/shared/widgets/row_widget.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/country_img.dart';

class CustomCountryScreen extends StatelessWidget {
  final String customCountryScreen = 'CustomCountryScreen';
  final int cases, todayCases, deaths, todayDeaths, recovered, todayRecovered;
  final String country, flag;
  const CustomCountryScreen({
    Key? key,
    required this.cases,
    required this.country,
    required this.flag,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2 + 100,
                    child: Stack(
                      children: [
                        CountryInfoWidget(
                          cases: cases,
                          country: country,
                          deaths: deaths,
                          flag: flag,
                          recovered: recovered,
                          todayCases: todayCases,
                          todayDeaths: todayDeaths,
                          todayRecovered: todayRecovered,
                        ),
                        CountryImageWidget(flag: flag),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const BackButtonWidget(
              navigation: SearchCountryScreen.searchCountryScreen,
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
