
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'balanceEntryProvider.dart';

part 'balanceStorageProvider.g.dart';

@riverpod
class BalanceStorageBuilder extends _$BalanceStorageBuilder {
  @override
  List<BalanceEntry> build (){
    //Load from persistent storage
    return List<BalanceEntry>.empty(growable: true);
  }

  addBalanceEntry(BalanceEntry balanceEntry) {
    print("Got new entry for storage");
    List<BalanceEntry> entries = List<BalanceEntry>.of(state);
    entries.add(balanceEntry);
    //Store new entry or complete list in persistant storage
    state = entries;
  }

  removeBalanceEntry(BalanceEntry balanceEntry) {
    print("Delete entry from storage");
    List<BalanceEntry> entries = List<BalanceEntry>.of(state);
    entries.remove(balanceEntry);
    //Store new entry or complete list in persistant storage
    state = entries;
  }
}

@riverpod
List<BalanceEntry> paymentBalanceEntries(PaymentBalanceEntriesRef ref) {
  final entries = ref.watch(balanceStorageBuilderProvider);
  return entries.where((element) => true).toList();
}

@riverpod
List<BalanceEntry> incomeBalanceEntries(IncomeBalanceEntriesRef ref) {
  final entries = ref.watch(balanceStorageBuilderProvider);
  return entries.where((element) => true).toList();
}