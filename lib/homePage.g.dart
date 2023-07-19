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
