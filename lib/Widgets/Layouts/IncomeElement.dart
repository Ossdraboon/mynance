import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:MyNance/Widgets/Buttons/ChartButton.dart';

import 'NumberField.dart';

const List<String> incomeList = <String>[
  'Other',
  'Borrow',
  'Gifts',
];
const List<String> incomeListManage = <String>[
  'Other',
  'Salary',
  'Rental',
  'Earnings',
  'Revenue',
  'Child Support',
  'Parental Allowance'
];



//income
class IncomeSection extends StatelessWidget {
  const IncomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(flex: 3, child: DropDownIncome()),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 9,
          child: Numberfield(hint: "add new Income", icon: Icons.money),
        ),
      ],
    );
  }
}

class DropDownIncomeManage extends StatefulWidget {
  const DropDownIncomeManage({super.key});

  @override
  State<DropDownIncomeManage> createState() => _DropDownIncomeManageState();
}

class _DropDownIncomeManageState extends State<DropDownIncomeManage> {
  String dropdownValue = incomeListManage.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      style: const TextStyle(color: Colors.black),
      alignment: Alignment.center,
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: incomeListManage.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class IncomeSectionManage extends StatelessWidget {
  const IncomeSectionManage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(flex: 3, child: DropDownIncomeManage()),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 9,
          child: Numberfield(hint: "Set your Incomes", icon: Icons.money),
        ),
      ],
    );
  }
}



class DropDownIncome extends StatefulWidget {
  const DropDownIncome({super.key});

  @override
  State<DropDownIncome> createState() => _DropDownIncomeState();
}

class _DropDownIncomeState extends State<DropDownIncome> {
  String dropdownValue = incomeList.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Categories",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        DropdownButton<String>(
          iconSize: 0.0,
          value: dropdownValue,
          isExpanded: true,
          underline: Container(),
          dropdownColor: Colors.transparent,
          elevation: 0,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          alignment: Alignment.center,
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: incomeList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SizedBox(
                child: Container(
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
                    child: Text(value)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
//