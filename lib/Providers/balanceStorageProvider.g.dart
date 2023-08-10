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
    r'4d163c76039db539741a7162d9606eba0c0ccec1';

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
String _$balanceStorageBuilderHash() =>
    r'2e6b0d2e27103ecfed6a3f0edab8763035ededb6';

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
