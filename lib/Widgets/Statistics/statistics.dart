import 'package:MyNance/Providers/balanceEntryProvider.dart';
import 'package:MyNance/Providers/balanceStorageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum StatisticsType { WEEKLY, MONTHLY, YEARLY }

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
      entries = ref.watch(balanceEntriesWeekProvider);
    }

    return ListView(
      children: entries.map((e) => Text(e.amount.toString())).toList(),
    );
  }
  //TODO view as chart!! Look in ChartSectionConfi;
}