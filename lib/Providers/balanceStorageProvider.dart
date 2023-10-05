import 'dart:convert';
import 'package:MyNance/Widgets/Layouts/Dropdown.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../Widgets/Layouts/InfoElement.dart';
import 'balanceEntryProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

part 'balanceStorageProvider.g.dart';

@JsonSerializable()
class BalanceEntryList {
  List<BalanceEntry> entries = List<BalanceEntry>.empty();

  BalanceEntryList();

  factory BalanceEntryList.fromJson(Map<String, dynamic> json) =>
      _$BalanceEntryListFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceEntryListToJson(this);
}

@riverpod
class BalanceStorageBuilder extends _$BalanceStorageBuilder {
  @override
  List<BalanceEntry> build() {
    load();
    //initFakeData();
    //Load from persistent storage
    return List<BalanceEntry>.empty(growable: true);
  }

  //TODO erstellen von Fakedaten für Datenbank
  load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("data");
    if (data != null) {
      state = BalanceEntryList.fromJson(jsonDecode(data)).entries;
    } else {
      var list = List<BalanceEntry>.empty(growable: true);
      DateTime start = DateTime(2023, 6, 1, 8, 30);
      for (int i = 0; i < 1000; i++) {
        BalanceEntry entry = BalanceEntry();
        if (i % 2 == 0) {
          int paymentpicker = Random().nextInt(9);
          entry.balanceType = BalanceType.payment;
          entry.categories = paymentList[paymentpicker];
        } else {
          int incomepicker = Random().nextInt(3);
          entry.balanceType = BalanceType.income;
          entry.categories = incomeList[incomepicker];
        }
        entry.created = start;
        if (entry.created.isAfter(DateTime.now())) {
          break;
        }
        start = start.add(const Duration(hours: 6));
        double rngAmount = (Random().nextDouble() * maxValue).roundToDouble();

        entry.amount = rngAmount;

        list.add(entry);
      }
      state = list;
      save();
      print("fakedate erstellt !!!");
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    var tmp = BalanceEntryList();
    tmp.entries = state;
    var json = jsonEncode(tmp.toJson());
    print("DATA to save: " + json);
    print("List length = " + tmp.entries.length.toString());
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
    state = entries;
    save();
  }
}

_last20EntriesReversed(Iterable<BalanceEntry> entries) {
  List<BalanceEntry> list = entries.toList();
  if (list.length > 20) {
    list = list.sublist(list.length - 20, list.length);
  }
  return list.reversed.toList();
}

@riverpod
List<BalanceEntry> paymentBalanceEntries(PaymentBalanceEntriesRef ref) {
  final entries = ref.watch(balanceStorageBuilderProvider);
  return _last20EntriesReversed(
      entries.where((element) => element.balanceType == BalanceType.payment));
}

@riverpod
List<BalanceEntry> incomeBalanceEntries(IncomeBalanceEntriesRef ref) {
  final entries = ref.watch(balanceStorageBuilderProvider);
  return entries
      .where((element) => element.balanceType == BalanceType.income)
      .toList();
}

@riverpod
List<BalanceEntry> balanceEntriesWeek(IncomeBalanceEntriesRef ref) {
  var upperLimit = DateTime.now();
  var lowerLimit = upperLimit.add(const Duration(days: -6));
  lowerLimit = lowerLimit.add(Duration(
      hours: -lowerLimit.hour,
      minutes: -lowerLimit.minute,
      seconds: -lowerLimit.second,
      milliseconds: -lowerLimit.millisecond));
  final entries = ref.watch(balanceStorageBuilderProvider);
  return entries
      .where((element) =>
              element.created.isAfter(lowerLimit) &&
              element.created.isBefore(
                  upperLimit) //filter if created in range of current week
          )
      .toList();
}

@riverpod
List<BalanceEntry> balanceEntriesMonth(IncomeBalanceEntriesRef ref) {
  var upperLimit = DateTime.now();
  var lowerLimit = DateTime(upperLimit.year, upperLimit.month, 1);

  lowerLimit = lowerLimit.add(Duration(
    hours: -lowerLimit.hour,
    minutes: -lowerLimit.minute,
    seconds: -lowerLimit.second,
    milliseconds: -lowerLimit.millisecond,
  ));
  final entries = ref.watch(balanceStorageBuilderProvider);
  return entries
      .where((element) =>
          element.created.isAfter(lowerLimit) &&
          element.created.isBefore(upperLimit))
      .toList();
}

@riverpod
List<BalanceEntry> balanceEntriesYear(IncomeBalanceEntriesRef ref) {
  var upperLimit = DateTime.now();
  var lowerLimit = DateTime(upperLimit.year, 1, 1);

  lowerLimit = lowerLimit.add(Duration(
    hours: -lowerLimit.hour,
    minutes: -lowerLimit.minute,
    seconds: -lowerLimit.second,
    milliseconds: -lowerLimit.millisecond,
  ));
  final entries = ref.watch(balanceStorageBuilderProvider);
  return entries
      .where((element) =>
  element.created.isAfter(lowerLimit) &&
      element.created.isBefore(upperLimit))
      .toList();
}


//TODO balance entries für month und year machen!
