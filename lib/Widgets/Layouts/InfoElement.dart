import 'dart:math';

import 'package:MyNance/Model/ChartSectionConfiguration.dart';
import 'package:MyNance/Model/Statistics.dart';
import 'package:MyNance/Providers/balanceEntryProvider.dart';
import 'package:MyNance/Widgets/Layouts/BarChart.dart';
import 'package:MyNance/Widgets/Statistics/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Providers/balanceStorageProvider.dart';
import '../Buttons/MyTextButtonAnalytics.dart';
import 'LineCharts.dart';

double maxValue = 200.00;
var fakedataList = List<double>.generate(
    7, (i) => (Random().nextDouble() * maxValue).roundToDouble())
  ..shuffle();

List<double> weeklyCost = [401.00, 1099.76, 167.2, 206.13, 1658, 77.99, 4.99];

class InfoSectionBuilder extends ConsumerWidget {
  late ChartSectionConfiguration _chartSectionConfiguration;

  InfoSectionBuilder(
      {super.key,
      required ChartSectionConfiguration chartSectionConfiguration}) {
    _chartSectionConfiguration = chartSectionConfiguration;
  }

  Widget build(BuildContext context, WidgetRef ref) {
    var graphData = GraphDataGenerator(
        ref.watch(balanceEntriesWeekProvider), StatisticsType.WEEKLY);
    return InfoSection(
      barChartConfiguration:
          BarChartConfiguration(graphData.titles, graphData.values),
      lineChartConfiguration: _chartSectionConfiguration.lineChartConfiguration,
    );
  }
}

//Info
class InfoSection extends StatefulWidget {
  late BarChartConfiguration _barChartConfiguration;
  late LineChartConfiguration _lineChartConfiguration;

  InfoSection(
      {super.key,
      required BarChartConfiguration barChartConfiguration,
      required LineChartConfiguration lineChartConfiguration}) {
    _barChartConfiguration = barChartConfiguration;
    _lineChartConfiguration = lineChartConfiguration;
  }

  @override
  State<InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white,
            Colors.blue.withOpacity(0.9),
            Colors.blue.withOpacity(0.9),
            Colors.lightBlue.withOpacity(0.8),
            Colors.cyan.withOpacity(0.1),
          ],
        ),
        // color: const Color.fromRGBO(
        //     15, 165, 210, 0.9),
        border: Border.all(
          color: const Color.fromRGBO(21, 80, 199, 0.3),
          width: 0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      //child: InfoSection(),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            StatisticsType.WEEKLY.title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Sandbox(barChartConfiguration: widget._barChartConfiguration),
          //LineChartSample2(weeklyCost),
          //PieChartSample1(),
          //PieChartSample2(),
          const MyTextButtonAnalytics(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
