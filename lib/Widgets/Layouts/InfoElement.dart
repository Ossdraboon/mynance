import 'dart:math';

import 'package:MyNance/Model/ChartSectionConfiguration.dart';
import 'package:MyNance/Widgets/Layouts/Sandbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Buttons/MyTextButtonAnalytics.dart';
import 'LineCharts.dart';

double maxValue = 1000.00;
var fakedataList = List<double>.generate(7, (i) => (Random().nextDouble() * maxValue).roundToDouble())..shuffle();



List<double> weeklyCost = [401.00, 199.76, 167.2, 206.13, 58, 77.99, 4.99];
List<String> weekDays = ["Mon", "Tue", "Wen", "Thu", "Fri", "Sat", "Sun"];


class InfoSectionBuilder extends StatefulWidget {
  late ChartSectionConfiguration _chartSectionConfiguration;

  InfoSectionBuilder({
    super.key, required ChartSectionConfiguration chartSectionConfiguration
  }){
    _chartSectionConfiguration = chartSectionConfiguration;
  }

  @override
  State<InfoSectionBuilder> createState() => _InfoSectionBuilderState();
}

class _InfoSectionBuilderState extends State<InfoSectionBuilder> {
  @override
  Widget build(BuildContext context) {
    return InfoSection(
      barChartConfiguration: widget._chartSectionConfiguration.barChartConfiguration,
      lineChartConfiguration: widget._chartSectionConfiguration.lineChartConfiguration,);
  }
}



//Info
class InfoSection extends StatefulWidget {
  late BarChartConfiguration _barChartConfiguration;
  late LineChartConfiguration _lineChartConfiguration;

   InfoSection({
    super.key, required BarChartConfiguration barChartConfiguration, required LineChartConfiguration lineChartConfiguration
  }){
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
          const SizedBox(height: 10,),
          const Text("Overview of Weekly expenditures",style: TextStyle(color: Colors.white,fontSize: 18),),
          Sandbox(barChartConfiguration: widget._barChartConfiguration),
          //LineChartSample2(weeklyCost),
          //PieChartSample1(),
          //PieChartSample2(),
          const MyTextButtonAnalytics(),
        ],
      ),
    );
  }
}




