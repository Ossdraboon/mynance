import 'package:MyNance/Model/ChartSectionConfiguration.dart';
import 'package:MyNance/Widgets/Layouts/Sandbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Buttons/MyTextButtonAnalytics.dart';
import 'LineCharts.dart';


List<double> weeklyCost = [55.90, 99.76, 167.2, 206.13, 58, 77.99, 4.99];
List<String> weekDays = ["Mon", "Tue", "Wen", "Thu", "Fri", "Sat", "Sun"];



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




