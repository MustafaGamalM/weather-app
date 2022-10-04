import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/forecaset_five_days.dart';

Widget linearChartBuilder(List<Listd> listModel) {
  List<LinearItemData> items = [];

  for (int n = 7; n < 40; n = n + 8) {
    items.add(
      LinearItemData(listModel[n].dtTxt.substring(5, 10),
          (listModel[n].main.temp - 272.15).toInt()),
    );
  }
  return Container(
    padding: const EdgeInsets.all(10),
    height: 180,
    width: double.infinity,
    child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<LinearItemData, dynamic>>[
          LineSeries<LinearItemData, String>(
              dataSource: items,
              xValueMapper: (LinearItemData i, _) => i.day,
              yValueMapper: (LinearItemData i, _) => i.temp,
              name: '5 days',
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ]),
  );
}

class LinearItemData {
  final String day;
  final int temp;

  LinearItemData(this.day, this.temp);
}
