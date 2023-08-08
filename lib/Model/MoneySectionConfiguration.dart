import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class MoneySectionConfiguration {
  String title;
  String subtitle;
  CategoryConfiguration categoryConfiguration;
  InputFieldConfiguration inputFieldConfiguration;
  QuickValueConfiguration quickValueConfiguration;
  HistoryBoxConfiguration historyBoxConfiguration;

  MoneySectionConfiguration(this.title, this.subtitle, this.categoryConfiguration,
      this.inputFieldConfiguration, this.quickValueConfiguration, this.historyBoxConfiguration);
}

class CategoryConfiguration {
  List<String> categories;

  CategoryConfiguration(this.categories);
}

class InputFieldConfiguration {
  String text;
  String hint;
  IconData icon;

  InputFieldConfiguration(this.text,this.hint, this.icon);
}

class QuickValueConfiguration {
  List<int> values;
  int signe;
  QuickValueConfiguration(this.values, this.signe);
}

enum Liste {paymant, income, goal}


class HistoryBoxConfiguration {
  bool isincome;

  HistoryBoxConfiguration(this.isincome);
}