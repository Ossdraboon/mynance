
import 'package:MyNance/Providers/balanceStorageProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balanceEntryProvider.g.dart';

class BalanceEntry {
  String categories = "Other";
  double? amount;
}


@riverpod
class BalanceEntryBuilder extends _$BalanceEntryBuilder {
  @override
  BalanceEntry build (){
    return BalanceEntry();
  }

  BalanceEntry _copy() {
    BalanceEntry obj = BalanceEntry();
    obj.categories = state.categories;
    obj.amount = state.amount;
    return obj;
  }

  checkState() {
    if(state.amount != null) {
      //add Entry in balanceStorageProvider
      ref.read(balanceStorageBuilderProvider.notifier).addBalanceEntry(state);
      state = BalanceEntry();
    }
  }

  setCategory(String category) {
    BalanceEntry copy = _copy();
    copy.categories = category;
    state = copy;
    checkState();
  }

  setAmount(double? amount) {
    BalanceEntry copy = _copy();
    copy.amount = amount;
    state = copy;
    checkState();
  }
}


@riverpod
class TestList extends _$TestList {
  @override
  List<BalanceEntry> build() {
    return List<BalanceEntry>.empty(growable: true);
  }

  List<BalanceEntry> _copy() {
    return List.of(state);
  }

  add(BalanceEntry object) {
    List<BalanceEntry> copy = _copy();
    copy.add(object);
    state = copy;
  }
}
