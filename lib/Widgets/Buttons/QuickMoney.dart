import 'package:MyNance/Model/MoneySectionConfiguration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Providers/balanceEntryProvider.dart';



class QuickMoney extends ConsumerWidget {
  late String _text;
  late MoneySectionConfiguration _configuration;

  QuickMoney(MoneySectionConfiguration configuration, {required String text, super.key}) {
    _text = text;
    _configuration = configuration;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return
      Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white,
              Colors.blue.withOpacity(0.9),
              Colors.blue.withOpacity(0.9),
              Colors.lightBlue.withOpacity(0.8),
              Colors.cyan.withOpacity(0.1),
            ],
          ),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            // color: const Color.fromRGBO(21, 80, 199, 0.3),
            width: 0,
          ),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.7),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            //padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 18),
          ),
          onPressed: () {
            ref.read(balanceEntryBuilderProvider.notifier).setBalanceType(_configuration.id, _configuration.historyBoxConfiguration.balanceType);
            ref.read(balanceEntryBuilderProvider.notifier).setAmount(_configuration.id,double.parse(_text));
          },
          child: Text("€$_text"),
        ),
      );
  }
}