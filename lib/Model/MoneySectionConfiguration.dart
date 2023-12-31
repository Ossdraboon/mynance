import 'package:flutter/material.dart';
import '../Providers/balanceEntryProvider.dart';

class MoneySectionConfiguration {
  int id;
  String title;
  String subtitle;
  CategoryConfiguration categoryConfiguration;
  InputFieldConfiguration inputFieldConfiguration;
  QuickValueConfiguration quickValueConfiguration;
  HistoryBoxConfiguration historyBoxConfiguration;

  MoneySectionConfiguration(
      this.id,
      this.title,
      this.subtitle,
      this.categoryConfiguration,
      this.inputFieldConfiguration,
      this.quickValueConfiguration,
      this.historyBoxConfiguration);
}

class CategoryConfiguration {
  List<String> categories;

  CategoryConfiguration(this.categories);
}

class InputFieldConfiguration {
  String text;
  String hint;
  IconData icon;

  InputFieldConfiguration(this.text, this.hint, this.icon);
}

class QuickValueConfiguration {
  List<int> values;
  int signe;

  QuickValueConfiguration(this.values, this.signe);
}

class HistoryBoxConfiguration {
  BalanceType balanceType;

  HistoryBoxConfiguration(this.balanceType);
}
