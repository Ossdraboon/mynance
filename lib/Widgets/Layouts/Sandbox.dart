import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../Model/ChartSectionConfiguration.dart';
import 'LineChartsColors.dart';


//Todo: P2, 10.07, Add a grid Class to set layout, leftside Infobar from 0 to highest value and avg in middle, Topside Bar dont need


class Sandbox extends StatefulWidget {
  //late List<String> dayNames;
  //late List<double> values;

  late BarChartConfiguration _barChartConfiguration;


  Sandbox({
    super.key, required BarChartConfiguration barChartConfiguration}){
    _barChartConfiguration = barChartConfiguration;
  }

  @override
  _SandboxState createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  late int showingTooltip;

  @override
  void initState() {
    showingTooltip = -1;
    super.initState();
  }

  BarChartGroupData generateGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: showingTooltip == x ? [0] : [],
      barRods: [
        BarChartRodData(fromY: 0, toY: y.toDouble(),
        gradient: _barsGradient),
      ],
    );
  }

  List<BarChartGroupData> generateValues(){
      List<BarChartGroupData> result = [];
      for (int i = 0; i < widget._barChartConfiguration.barchartValues.length; i++){
        result.add(generateGroupData(i, widget._barChartConfiguration.barchartValues.elementAt(i)));
      }

      // for (int i = 0; i < widget.values.length; ++i){
      //   result.add(generateGroupData(i, widget.values.elementAt(i)));
      // }
      return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: AspectRatio(
            aspectRatio: 2,
            child: BarChart(
              BarChartData(
                barGroups: generateValues(),
                barTouchData: getBarTouchData(),
                titlesData: getTitelsData(),
                //gridData: const FlGridData(show: false),  //Griddata make a class
                //borderData: borderData,

              ),
            ),
          ),
        ),
      ),
    );
  }
  BarTouchData getBarTouchData() {
    return BarTouchData(
        enabled: true,
        handleBuiltInTouches: false,
        touchCallback: (event, response) {
          if (response != null && response.spot != null && event is FlTapUpEvent) {
            setState(() {
              final x = response.spot!.touchedBarGroup.x;
              final isShowing = showingTooltip == x;
              if (isShowing) {
                showingTooltip = -1;
              } else {
                showingTooltip = x;
              }
            });
          }
        },
        mouseCursorResolver: (event, response) {
          return response == null || response.spot == null
              ? MouseCursor.defer
              : SystemMouseCursors.click;
        }
    );
  }

  LinearGradient get _barsGradient => const LinearGradient(
    colors: [
      AppColors.contentColorWhite,
      AppColors.contentColorCyan,
      AppColors.contentColorBlue,
      AppColors.contentColorPink,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );

  FlTitlesData getTitelsData() {
    return FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: bottomTitles,
                    reservedSize: 42,
                  ),
                ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: leftTitles,
          reservedSize: 50,
        )
      )
              );
  }

Widget leftTitles(double value, TitleMeta meta){
    final Widget text = Text("test",
      //widget._barChartConfiguration.barchartValues[value.toInt()],
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );

}

  Widget bottomTitles(double value, TitleMeta meta) {
    //final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      widget._barChartConfiguration.barchartDays[value.toInt()],
      //widget.dayNames[value.toInt()],
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }
}