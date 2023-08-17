class ChartSectionConfiguration {
  LineChartConfiguration lineChartConfiguration;
  BarChartConfiguration barChartConfiguration;

  ChartSectionConfiguration(
      this.lineChartConfiguration, this.barChartConfiguration);
}

class LineChartConfiguration {
  List<num> lineChartInputs;

  LineChartConfiguration(this.lineChartInputs);
}

class BarChartConfiguration {
  List<double> barchartValues;
  List<String> barchartDays;

  BarChartConfiguration(this.barchartDays, this.barchartValues);
}
