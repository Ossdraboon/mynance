import 'dart:ffi';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../Model/ChartSectionConfiguration.dart';
import 'LineChartsColors.dart';

//Todo: P2, 10.07, Add a grid Class to set layout, leftside Infobar from 0 to highest value and avg in middle, Topside Bar dont need

class Sandbox extends StatefulWidget {
  late BarChartConfiguration _barChartConfiguration;

  Sandbox({super.key, required BarChartConfiguration barChartConfiguration}) {
    _barChartConfiguration = barChartConfiguration;
  }

  @override
  _SandboxState createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  late int showingTooltip;
  var lastVerticalValue = -1 * double.maxFinite;

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
        BarChartRodData(
          fromY: 0,
          toY: y.toDouble(),
          gradient: _barsGradient,
          width: 24,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        ),
      ],
    );
  }

  List<BarChartGroupData> generateValues() {
    List<BarChartGroupData> result = [];
    for (int i = 0;
        i < widget._barChartConfiguration.barchartValues.length;
        i++) {
      result.add(generateGroupData(
          i, widget._barChartConfiguration.barchartValues.elementAt(i)));
    }

    // for (int i = 0; i < widget.values.length; ++i){
    //   result.add(generateGroupData(i, widget.values.elementAt(i)));
    // }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: AspectRatio(
          aspectRatio: 2,
          child: BarChart(
            BarChartData(
              barGroups: generateValues(),
              barTouchData: getBarTouchData(),
              titlesData: getTitelsData(),
              maxY: ((widget._barChartConfiguration.barchartValues.reduce(max)/100).ceil()) * 100,
              gridData: const FlGridData(
                  drawVerticalLine: false), //Griddata make a class
              //borderData: borderData,
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
          if (response != null &&
              response.spot != null &&
              event is FlTapUpEvent) {
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
        });
  }

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          AppColors.contentColorWhite,
          AppColors.contentColorCyan,
          AppColors.contentColorBlue,
          AppColors.contentColorPurple,
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
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: bottomTitles,
            reservedSize: 26,
          ),
        ),
        leftTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: leftTitles,
          reservedSize: 55,
          interval: 100,
        )));
  }

  Widget leftTitles(double value, TitleMeta meta) {
    var label = "";

    if (lastVerticalValue == 0 ||
        ((value - lastVerticalValue) / lastVerticalValue).abs() > 0.05) {
      if (value > 1000) {
        label = ("${(value / 1000).toStringAsFixed(1)}K");
      } else {
        label = value.toStringAsFixed(0);
      }
    }
    print("leftTitles: $lastVerticalValue $value [$label]");

    final Widget text = Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
    lastVerticalValue = value;
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
      space: 4, //margin top
      child: text,
    );
  }
}
