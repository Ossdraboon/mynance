import 'package:MyNance/Model/ChartSectionConfiguration.dart';
import 'package:MyNance/Model/Statistics.dart';
import 'package:MyNance/Providers/balanceEntryProvider.dart';
import 'package:MyNance/Providers/balanceStorageProvider.dart';
import 'package:MyNance/Widgets/Buttons/MyBackButton.dart';
import 'package:MyNance/Widgets/Buttons/MyTextButtonAnalytics.dart';
import 'package:MyNance/Widgets/Layouts/BarChart.dart';
import 'package:MyNance/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Statistics extends ConsumerWidget {
  late StatisticsType type;

  Statistics(StatisticsType type, {super.key}) {
    this.type = type;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<BalanceEntry> entries;
    if (type == StatisticsType.WEEKLY) {
      entries = ref.watch(balanceEntriesWeekProvider);
    } else if (type == StatisticsType.MONTHLY) {
      entries = ref.watch(balanceEntriesMonthProvider);
    } else {
      entries = ref.watch(balanceEntriesYearProvider);
    }
    var graphData = GraphDataGenerator(entries, type);

    var chartConfiguration =
        BarChartConfiguration(graphData.titles, graphData.values);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          const CircularParticleScreen(),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white,
                  Colors.blue.withOpacity(0.5),
                  Colors.blue.withOpacity(0.3),
                  Colors.lightBlue.withOpacity(0.2),
                  Colors.cyan.withOpacity(0.1),
                ],
              ),
              // color: const Color.fromRGBO(
              //     15, 165, 210, 0.9),
              border: Border.all(
                color: const Color.fromRGBO(21, 80, 199, 0.3),
                width: 0,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  type.title,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                Sandbox(barChartConfiguration: chartConfiguration),
                const SizedBox(
                  height: 20,
                ),
                const MyBackButtonInfoSection()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
