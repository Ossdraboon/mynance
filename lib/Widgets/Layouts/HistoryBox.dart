import 'package:MyNance/Providers/balanceEntryProvider.dart';
import 'package:MyNance/Providers/balanceStorageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
              width: 0,
              color: Colors.white.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child:
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: const Icon(Icons.delete_forever,color: Colors.blueAccent,size: 25,), onPressed: () {
                      ref.read(balanceStorageBuilderProvider.notifier).removeBalanceEntry(_balanceEntry);
                    }),
                    Expanded(child: Text(_balanceEntry.categories, style: TextStyle(color: Colors.white,fontSize: 20),)),
                    // SizedBox(width: 30,),
                    Expanded(child: Text("€ ${_balanceEntry.amount!.toStringAsFixed(2)}", textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 20),)),
                    SizedBox(width: 20,)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // IconButton(icon: const Icon(Icons.delete,color: Colors.red,size: 25,), onPressed: () {
                    // ref.read(balanceStorageBuilderProvider.notifier).removeAllEntrys(_balanceEntry);}),
                    SizedBox(width: 50,),
                    Expanded(child: Text("Date of Booking Entry :", style: TextStyle(color: Colors.white), )),
                    Expanded(child: Text(DateFormat("y.MM.dd. HH:mm").format(_balanceEntry.created),textAlign: TextAlign.right, style:TextStyle(color: Colors.white) , )),
                    SizedBox(width: 20,),

                  ],
                )
              ],
            ),
      );
  }
}



