// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balanceStorageProvider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentBalanceEntriesHash() =>
    r'6b3d71deed6186c3e5105e27e50b2d62c99e541d';

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
    r'0fcd3710dd43b0b5401258abe454b27a00d2da9d';

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
    r'd97c6f785b1851c5a99683ebe53f34b78a79e405';

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
