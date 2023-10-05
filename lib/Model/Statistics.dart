import 'package:MyNance/Providers/balanceEntryProvider.dart';

enum StatisticsType {

  WEEKLY("Overview of Weekly expenditures"), MONTHLY("Overview of Monthly expenditures"), YEARLY("Overview of Yearl expenditures");

  const StatisticsType(this.title);

  final String title;
}

List<String> weekDays = ["Mon", "Tue", "Wen", "Thu", "Fri", "Sat", "Sun"];
List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

class GraphDataGenerator {
  List<double> values = List<double>.empty(growable: true);
  List<String> titles = List<String>.empty(growable: true);

  GraphDataGenerator(List<BalanceEntry> entries, StatisticsType type) {
    if (type == StatisticsType.WEEKLY) {
      _generateWeek(entries);
    } else if (type == StatisticsType.MONTHLY) {
      _generateMonth(entries);
    } else {
      _generateYear(entries);
    }
  }

  _generateWeek(List<BalanceEntry> entries) {
    if (entries.isEmpty) {
      values.add(100);
      titles.add(1.toString());
      return;
    }

    DateTime lower = entries[0].created;
    lower = lower.add(Duration(
        hours: -lower.hour,
        minutes: -lower.minute,
        seconds: -lower.second,
        milliseconds: -lower.millisecond));
    DateTime upper = lower.add(const Duration(days: 1));

    for (int i = 0; i < 7; i++) {
      var tmp = entries.where((element) =>
      element.created.isAfter(lower) && element.created.isBefore(upper));
      double value = 0;
      for (var element in tmp) {
        if (element.balanceType == BalanceType.payment) {
          value += element.amount ?? 0;
        }
        // else if(element.balanceType == BalanceType.payment){
        //   value -= element.amount ?? 0;}
      }
      values.add(value);
      titles.add(weekDays[lower.weekday - 1]);
      lower = lower.add(const Duration(days: 1));
      upper = upper.add(const Duration(days: 1));
    }
  }

  _generateMonth(List<BalanceEntry> entries) {
    if (entries.isEmpty) {
      values.add(100);
      titles.add(1.toString());
      return;
    }

    DateTime lower = DateTime.now().copyWith(day: 1, hour: 0, minute: 0, second: 0, microsecond: 0, millisecond: 0);
    DateTime upper = lower.add(const Duration(days: 1));
    DateTime now = DateTime.now();

    for (int i = 0; i < 31; i++) {
      if(lower.month != now.month || lower.day > now.day) {
        break;
      }
      var tmp = entries.where((element) =>
      element.created.isAfter(lower) && element.created.isBefore(upper));
      double value = 0;
      for (var element in tmp) {
        if (element.balanceType == BalanceType.payment) {
          value += element.amount ?? 0;
        }
        // else if(element.balanceType == BalanceType.payment){
        //   value -= element.amount ?? 0;}
      }
      values.add(value);
      titles.add(lower.day.toString());
      lower = lower.add(const Duration(days: 1));
      upper = upper.add(const Duration(days: 1));
    }
  }

  _generateYear(List<BalanceEntry> entries) {
    if (entries.isEmpty) {
      values.add(100);
      titles.add(1.toString());
      return;
    }

    DateTime lower = entries[0].created;
    lower = lower.add(Duration(
        hours: -lower.hour,
        minutes: -lower.minute,
        seconds: -lower.second,
        milliseconds: -lower.millisecond));
    DateTime upper = lower.copyWith(month: lower.month + 1);

    for (int i = 0; i < 12; i++) {
      if(lower.isAfter(DateTime.now())) {
        break;
      }
      var tmp = entries.where((element) =>
      element.created.isAfter(lower) && element.created.isBefore(upper));
      double value = 0;
      for (var element in tmp) {
        if (element.balanceType == BalanceType.payment) {
          value += element.amount ?? 0;
        }
        // else if(element.balanceType == BalanceType.payment){
        //   value -= element.amount ?? 0;}
      }
      values.add(value);
      titles.add(months[lower.month - 1]);
      lower = lower.copyWith(month: lower.month + 1);
      upper = upper.copyWith(month: upper.month + 1);
    }
  }
}