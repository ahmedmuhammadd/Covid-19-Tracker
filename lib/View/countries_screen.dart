import 'dart:developer';

import 'package:covid_tracker/View/detailed_country.dart';
import 'package:covid_tracker/View/world_state.dart';
import 'package:covid_tracker/shared/widgets/back_widget.dart';
import 'package:flutter/material.dart';
import '../services/services.dart';
import '../shared/utilities.dart';
import '../shared/widgets/navigate_country_widget.dart';
import '../shared/widgets/shimmer_widget.dart';

class SearchCountryScreen extends StatefulWidget {
  static const String searchCountryScreen = 'SearchCountryScreen';

  const SearchCountryScreen({Key? key}) : super(key: key);

  @override
  State<SearchCountryScreen> createState() => _SearchCountryScreenState();
}

class _SearchCountryScreenState extends State<SearchCountryScreen> {
  late TextEditingController _controller;

  @override
  initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            TextFormField(
              cursorColor: Colors.white,
              controller: _controller,
              onChanged: (value) {
                setState(() {});
              },
              decoration: const InputDecoration(
                fillColor: Colors.transparent,
                label: Icon(Icons.flag),
                hintText: 'Search by country name ',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: StatesServices().getCountries(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data[index]['country'];
                        if (_controller.text.isEmpty) {
                          return NavigateToCountryWidget(
                            cases: snapshot.data[index]['cases'],
                            country: snapshot.data[index]['country'],
                            deaths: snapshot.data[index]['deaths'],
                            flag: snapshot.data[index]['countryInfo']['flag'],
                            recovered: snapshot.data[index]['recovered'],
                            todayCases: snapshot.data[index]['todayCases'],
                            todayDeaths: snapshot.data[index]['todayDeaths'],
                            todayRecovered: snapshot.data[index]
                                ['todayRecovered'],
                          );
                        }
                        if (name
                            .toLowerCase()
                            .contains(_controller.text.toLowerCase())) {
                          return NavigateToCountryWidget(
                            cases: snapshot.data[index]['cases'],
                            country: snapshot.data[index]['country'],
                            deaths: snapshot.data[index]['deaths'],
                            flag: snapshot.data[index]['countryInfo']['flag'],
                            recovered: snapshot.data[index]['recovered'],
                            todayCases: snapshot.data[index]['todayCases'],
                            todayDeaths: snapshot.data[index]['todayDeaths'],
                            todayRecovered: snapshot.data[index]
                                ['todayRecovered'],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const ShimmerWidget();
                  } else {
                    return const Center(
                      child: Text('Data Error'),
                    );
                  }
                },
              ),
            ),
            const BackButtonWidget(
                navigation: WorldStateScreen.worldStateScreen),
          ],
        ),
      ),
    );
  }
}
