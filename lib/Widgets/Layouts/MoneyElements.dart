import 'package:MyNance/Model/MoneySectionConfiguration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Dropdown.dart';
import 'NumberField.dart';

var quickmoneyList = [5, 10, 20, 50];


class MoneySection extends StatefulWidget {
  late MoneySectionConfiguration _configuration;

  MoneySection({
    super.key, required MoneySectionConfiguration configuration }) {
    _configuration = configuration;
  }

  @override
  State<MoneySection> createState() => _MoneySectionState();
}

class _MoneySectionState extends State<MoneySection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 10,
        ),
         Expanded(flex: 4, child: DropDown(configuration: widget._configuration)),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 9,
          child: Container(
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

            child: Numberfield(inputFieldConfiguration: widget._configuration.inputFieldConfiguration, configuration: widget._configuration),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}



