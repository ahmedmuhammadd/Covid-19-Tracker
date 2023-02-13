import 'package:flutter/material.dart';

import '../../View/detailed_country.dart';

class NavigateToCountryWidget extends StatelessWidget {
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final String country;
  final String flag;
  const NavigateToCountryWidget({
    Key? key,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.country,
    required this.flag,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomCountryScreen(
              cases: cases,
              country: country,
              flag: flag,
              todayCases: todayCases,
              deaths: deaths,
              todayDeaths: todayDeaths,
              recovered: recovered,
              todayRecovered: todayRecovered,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            title: Text(country),
            subtitle: Text(cases.toString()),
            leading: Image(
              height: 50,
              width: 50,
              image: NetworkImage(flag),
            ),
          ),
        ],
      ),
    );
  }
}
