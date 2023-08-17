// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balanceStorageProvider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceEntryList _$BalanceEntryListFromJson(Map<String, dynamic> json) =>
    BalanceEntryList()
      ..entries = (json['entries'] as List<dynamic>)
          .map((e) => BalanceEntry.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$BalanceEntryListToJson(BalanceEntryList instance) =>
    <String, dynamic>{
      'entries': instance.entries,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentBalanceEntriesHash() =>
    r'3b9987e3d80bb79c6533249f19b7d1796735fb6f';

/// See also [paymentBalanceEntries].
@ProviderFor(paymentBalanceEntries)
final paymentBalanceEntriesProvider =
    AutoDisposeProvider<List<BalanceEntry>>.internal(
  paymentBalanceEntries,
  name: r'paymentBalanceEntriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentBalanceEntriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PaymentBalanceEntriesRef = AutoDisposeProviderRef<List<BalanceEntry>>;
String _$incomeBalanceEntriesHash() =>
    r'c77964683ea3c22242f28fc276b2e87bd2e5b801';

/// See also [incomeBalanceEntries].
@ProviderFor(incomeBalanceEntries)
final incomeBalanceEntriesProvider =
    AutoDisposeProvider<List<BalanceEntry>>.internal(
  incomeBalanceEntries,
  name: r'incomeBalanceEntriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$incomeBalanceEntriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IncomeBalanceEntriesRef = AutoDisposeProviderRef<List<BalanceEntry>>;
String _$balanceEntriesWeekHash() =>
    r'7645d77c47587275e28dec1896fced3d9a1544d9';

/// See also [balanceEntriesWeek].
@ProviderFor(balanceEntriesWeek)
final balanceEntriesWeekProvider =
    AutoDisposeProvider<List<BalanceEntry>>.internal(
  balanceEntriesWeek,
  name: r'balanceEntriesWeekProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$balanceEntriesWeekHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BalanceEntriesWeekRef = AutoDisposeProviderRef<List<BalanceEntry>>;
String _$balanceStorageBuilderHash() =>
    r'9f67cf87c028f41e6ff3f46a9e40338146eb2f4c';

/// See also [BalanceStorageBuilder].
@ProviderFor(BalanceStorageBuilder)
final balanceStorageBuilderProvider = AutoDisposeNotifierProvider<
    BalanceStorageBuilder, List<BalanceEntry>>.internal(
  BalanceStorageBuilder.new,
  name: r'balanceStorageBuilderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$balanceStorageBuilderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BalanceStorageBuilder = AutoDisposeNotifier<List<BalanceEntry>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
