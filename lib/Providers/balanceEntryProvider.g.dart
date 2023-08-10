// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balanceEntryProvider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceEntry _$BalanceEntryFromJson(Map<String, dynamic> json) => BalanceEntry()
  ..categories = json['categories'] as String
  ..amount = (json['amount'] as num?)?.toDouble()
  ..created = DateTime.parse(json['created'] as String)
  ..balanceType = $enumDecode(_$BalanceTypeEnumMap, json['balanceType']);

Map<String, dynamic> _$BalanceEntryToJson(BalanceEntry instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'amount': instance.amount,
      'created': instance.created.toIso8601String(),
      'balanceType': _$BalanceTypeEnumMap[instance.balanceType]!,
    };

const _$BalanceTypeEnumMap = {
  BalanceType.payment: 'payment',
  BalanceType.income: 'income',
  BalanceType.goal: 'goal',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$balanceEntryBuilderHash() =>
    r'f0346a0d188af70dc31c71de2c03f4ddcb4acadb';

/// See also [BalanceEntryBuilder].
@ProviderFor(BalanceEntryBuilder)
final balanceEntryBuilderProvider =
    AutoDisposeNotifierProvider<BalanceEntryBuilder, BalanceMap>.internal(
  BalanceEntryBuilder.new,
  name: r'balanceEntryBuilderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$balanceEntryBuilderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BalanceEntryBuilder = AutoDisposeNotifier<BalanceMap>;
String _$testListHash() => r'230d0773b9ebecf8c3661569511b259ebe97ba23';

/// See also [TestList].
@ProviderFor(TestList)
final testListProvider =
    AutoDisposeNotifierProvider<TestList, List<BalanceEntry>>.internal(
  TestList.new,
  name: r'testListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$testListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestList = AutoDisposeNotifier<List<BalanceEntry>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
