import 'dart:developer';
import 'package:covid_tracker/View/splash_screen.dart';
import 'package:covid_tracker/model/world_cases_model.dart';
import 'package:covid_tracker/shared/widgets/back_widget.dart';
import 'package:covid_tracker/shared/widgets/main_button.dart';
import 'package:covid_tracker/shared/widgets/pie_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/services.dart';
import '../shared/widgets/row_widget.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);
  static const String worldStateScreen = 'WorldStateScreen';

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: StatesServices().getWolrdStates(),
        builder: (context, AsyncSnapshot<WorldCasesModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitFadingCircle(
                color: Colors.white,
                controller: _controller,
                size: 50.0,
              ),
            );
          }
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                PieChartWidget(
                  death: snapshot.data!.deaths.toString(),
                  recovered: snapshot.data!.recovered.toString(),
                  total: snapshot.data!.cases.toString(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2 + 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 15),
                    child: Card(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ReusableWidget(
                              title: 'TOTAL',
                              value: snapshot.data!.cases.toString(),
                            ),
                            ReusableWidget(
                              title: 'RECOVERD',
                              value: snapshot.data!.recovered.toString(),
                            ),
                            ReusableWidget(
                              title: 'DEATHS',
                              value: snapshot.data!.deaths.toString(),
                            ),
                            ReusableWidget(
                              title: ' ACTIVE',
                              value: snapshot.data!.active.toString(),
                            ),
                            ReusableWidget(
                              title: 'CRITICAL',
                              value: snapshot.data!.critical.toString(),
                            ),
                            ReusableWidget(
                              title: 'TODAY DEATH ',
                              value: snapshot.data!.todayDeaths.toString(),
                            ),
                            ReusableWidget(
                              title: 'TODAY RECOVERD ',
                              value: snapshot.data!.todayRecovered.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const MainButton(),
                const Spacer(),
                const BackButtonWidget(
                  navigation: SplashScreen.splashScreen,
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('Error !'),
            );
          }
        },
      ),
    );
  }
}
