import 'package:MyNance/Providers/balanceStorageProvider.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'balanceEntryProvider.g.dart';

enum BalanceType {
  payment, income, goal
}


@JsonSerializable()
class BalanceEntry {
  String categories = "Other";
  double? amount;
  DateTime created = DateTime.now();
  BalanceType balanceType = BalanceType.payment;

  BalanceEntry();

  factory BalanceEntry.fromJson(Map<String, dynamic> json) => _$BalanceEntryFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceEntryToJson(this);
}




class BalanceMap {
  Map<int, BalanceEntry> _map = Map();

  BalanceEntry getBalanceEntry(int id) {
    BalanceEntry? entry = _map[id];
    if(entry == null) {
      entry = BalanceEntry();
      _map[id]= entry;
    }
    return entry;
  }

  removeBalanceEntry(int id) {
    _map.remove(id);
  }

  copy() {
    BalanceMap map = BalanceMap();
    map._map = Map.of(_map);
    return map;
  }
}

@riverpod
class BalanceEntryBuilder extends _$BalanceEntryBuilder {
  @override
  BalanceMap build (){
    return BalanceMap();
  }

  checkState(int id) {
    BalanceEntry entry = state.getBalanceEntry(id);
    if(entry.amount != null) {
      //add Entry in balanceStorageProvidera
      ref.read(balanceStorageBuilderProvider.notifier).addBalanceEntry(entry);
      state.removeBalanceEntry(id);
      state = state.copy();
    }
  }

  setCategory(int id, String category) {
    state.getBalanceEntry(id).categories = category;
    state = state.copy();
    checkState(id);
  }

  setAmount(int id, double? amount) {
    state.getBalanceEntry(id).amount = amount;
    state = state.copy();
    checkState(id);
  }

  setBalanceType(int id, BalanceType balanceType) {
    state.getBalanceEntry(id).balanceType = balanceType;
    state = state.copy();
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
