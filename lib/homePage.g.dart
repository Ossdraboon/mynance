// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homePage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBankMoney _$DataBankMoneyFromJson(Map<String, dynamic> json) =>
    DataBankMoney(
      categorie: json['categorie'] as String,
      value: (json['value'] as num).toDouble(),
    )..created = DateTime.parse(json['created'] as String);

Map<String, dynamic> _$DataBankMoneyToJson(DataBankMoney instance) =>
    <String, dynamic>{
      'categorie': instance.categorie,
      'value': instance.value,
      'created': instance.created.toIso8601String(),
    };

DataInputs _$DataInputsFromJson(Map<String, dynamic> json) => DataInputs(
      userText: json['userText'] as String,
      userNumber: (json['userNumber'] as num).toDouble(),
    )..inputlist = (json['inputlist'] as List<dynamic>)
        .map((e) => DataBankMoney.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$DataInputsToJson(DataInputs instance) =>
    <String, dynamic>{
      'userText': instance.userText,
      'userNumber': instance.userNumber,
      'inputlist': instance.inputlist,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$testListHash() => r'8d8ff1efd0af8b1813ad6a84ce4d7cc438d58e74';

/// See also [TestList].
@ProviderFor(TestList)
final testListProvider =
    AutoDisposeNotifierProvider<TestList, List<Testobject>>.internal(
  TestList.new,
  name: r'testListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$testListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestList = AutoDisposeNotifier<List<Testobject>>;
String _$testobjectbuilderHash() => r'2ca1581c91073e298df5f74a4cfb9222757746c8';

/// See also [Testobjectbuilder].
@ProviderFor(Testobjectbuilder)
final testobjectbuilderProvider =
    AutoDisposeNotifierProvider<Testobjectbuilder, Testobject>.internal(
  Testobjectbuilder.new,
  name: r'testobjectbuilderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testobjectbuilderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Testobjectbuilder = AutoDisposeNotifier<Testobject>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
