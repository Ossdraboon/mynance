import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'balanceEntryProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'balanceStorageProvider.g.dart';

@JsonSerializable()
class BalanceEntryList {
  List<BalanceEntry> entries = List<BalanceEntry>.empty();

  BalanceEntryList();

  factory BalanceEntryList.fromJson(Map<String, dynamic> json) => _$BalanceEntryListFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceEntryListToJson(this);
}

@riverpod
class BalanceStorageBuilder extends _$BalanceStorageBuilder {
  @override
  List<BalanceEntry> build (){
    //initFakeData();
    load();
    //Load from persistent storage
    return List<BalanceEntry>.empty(growable: true);
  }

  // initFakeData() async {
  //   List<BalanceEntry> fakeDataList = List<BalanceEntry>.empty(growable: true);
  //   for(int i = 0; i< 1000;i++) {
  //     BalanceEntry entry = BalanceEntry();
  //     if(i % 2 == 0) {
  //       entry.balanceType = BalanceType.payment;
  //     } else {
  //       entry.balanceType = BalanceType.income;
  //     }
  //     entry.created = //Increment date by one day
  //     entry.amount = 123;
  //     fakeDataList.add(entry);
  //   }
  //   state = fakeDataList;
  //   save();
  // }

  load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("data");
    print("DATA: $data");
    if(data != null) {
      state = BalanceEntryList.fromJson(jsonDecode(data)).entries;
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    var tmp = BalanceEntryList();
    tmp.entries = state;
    var json = jsonEncode(tmp.toJson());
    print("DATA to save: " + json);
    await prefs.setString("data", json);
  }

  addBalanceEntry(BalanceEntry balanceEntry) async {
    print("Got new entry for storage");

    List<BalanceEntry> entries = List<BalanceEntry>.of(state);
    entries.add(balanceEntry);
    state = entries;
    save();
  }

  removeBalanceEntry(BalanceEntry balanceEntry) {
    print("Delete entry from storage");
    List<BalanceEntry> entries = List<BalanceEntry>.of(state);
    entries.remove(balanceEntry);
    save();
  }
}

@riverpod
List<BalanceEntry> paymentBalanceEntries(PaymentBalanceEntriesRef ref) {
  final entries = ref.watch(balanceStorageBuilderProvider);
  return entries.where((element) => element.balanceType == BalanceType.payment).toList();
}

@riverpod
List<BalanceEntry> incomeBalanceEntries(IncomeBalanceEntriesRef ref) {
  final entries = ref.watch(balanceStorageBuilderProvider);
  return entries.where((element) => element.balanceType == BalanceType.income).toList();
}

@riverpod
List<BalanceEntry> balanceEntriesWeek(IncomeBalanceEntriesRef ref) {
  //current date
  final entries = ref.watch(balanceStorageBuilderProvider);
  return entries.where((element) => true //filter if created in range of current week
      ).toList();
}