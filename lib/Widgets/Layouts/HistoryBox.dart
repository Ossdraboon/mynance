import 'package:MyNance/Providers/balanceEntryProvider.dart';
import 'package:MyNance/Providers/balanceStorageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Buttons/MyIconButton.dart';



class HistoryBox extends ConsumerWidget {
  late BalanceEntry _balanceEntry;

  HistoryBox({required BalanceEntry balanceEntry, super.key}) {
    _balanceEntry = balanceEntry;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return
      Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
              width: 0,
              color: Colors.white.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            IconButton(icon: const Icon(Icons.delete_forever,color: Colors.blueAccent), onPressed: () {
              ref.read(balanceStorageBuilderProvider.notifier).removeBalanceEntry(_balanceEntry);
            }),
            SizedBox(width: 30),
            Text(_balanceEntry.categories, style: TextStyle(color: Colors.white),),
            const SizedBox(width: 50),
            Text(_balanceEntry.amount.toString(), style: TextStyle(color: Colors.white),),
          ],
        ),
      );
  }
}



