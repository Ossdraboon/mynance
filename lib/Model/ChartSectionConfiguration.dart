import 'package:flutter/material.dart';




class ChartSectionConfiguration{
LineChartConfiguration lineChartConfiguration;

ChartSectionConfiguration(this.lineChartConfiguration);
}


class LineChartConfiguration {
  List<num> lineChartInputs;

  LineChartConfiguration(this.lineChartInputs);
}