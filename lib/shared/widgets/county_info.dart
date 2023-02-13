import 'package:covid_tracker/shared/widgets/row_widget.dart';
import 'package:flutter/material.dart';

class CountryInfoWidget extends StatelessWidget {
  final int cases, todayCases, deaths, todayDeaths, recovered, todayRecovered;
  final String country, flag;
  const CountryInfoWidget({
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Card(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ReusableWidget(
                  title: 'country',
                  value: country.toString(),
                ),
                ReusableWidget(
                  title: 'cases',
                  value: cases.toString(),
                ),
                ReusableWidget(
                  title: 'todayCases',
                  value: todayCases.toString(),
                ),
                ReusableWidget(
                  title: 'deaths',
                  value: deaths.toString(),
                ),
                ReusableWidget(
                  title: 'todayDeaths',
                  value: todayDeaths.toString(),
                ),
                ReusableWidget(
                  title: 'recovered',
                  value: recovered.toString(),
                ),
                ReusableWidget(
                  title: 'todayRecovered',
                  value: todayRecovered.toString(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
