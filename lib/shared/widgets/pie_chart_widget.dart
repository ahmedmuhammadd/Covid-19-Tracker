import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../utilities.dart';

class PieChartWidget extends StatelessWidget {
  final String total, recovered, death;

  const PieChartWidget({
    required this.death,
    required this.recovered,
    required this.total,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      legendOptions: const LegendOptions(legendPosition: LegendPosition.left),
      dataMap: {
        'TOTAL': double.parse(total),
        'RECOVERED': double.parse(recovered),
        'DEATHS': double.parse(death),
      },
      chartValuesOptions:
          const ChartValuesOptions(showChartValuesInPercentage: true),
      animationDuration: const Duration(milliseconds: 1200),
      chartType: ChartType.ring,
      colorList: Utilities.colorList,
      chartRadius: MediaQuery.of(context).size.width / 3,
    );
  }
}
