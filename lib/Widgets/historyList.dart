import 'package:MyNance/Providers/balanceStorageProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/MoneySectionConfiguration.dart';
import '../Providers/balanceEntryProvider.dart';
import 'Layouts/HistoryBox.dart';

class HistoryList extends ConsumerWidget {
  late HistoryBoxConfiguration configuration;

  HistoryList(HistoryBoxConfiguration configuration, {super.key}) {
    this.configuration = configuration;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<BalanceEntry> entries;

    if(configuration.isincome) {
      entries = ref.watch(incomeBalanceEntriesProvider);
    } else {
      entries = ref.watch(paymentBalanceEntriesProvider);
    }

   return Column(
      children: [
        const Text("History List",style: TextStyle(color: Colors.white,fontSize: 20)),
        const SizedBox(height: 10),
        Container(
          height: 200,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: entries.map((element) => HistoryBox(
                  balanceEntry: element,
                ))
                    .toList()),
          ),
        ),
      ],
    );
  }
}
