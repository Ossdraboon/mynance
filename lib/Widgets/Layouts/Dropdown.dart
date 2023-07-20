import 'package:MyNance/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Model/MoneySectionConfiguration.dart';

const List<String> paymentList = <String>[
  'Other',
  'Food',
  'Clothing',
  'Children',
  'Health',
  'Travel',
  'Car',
  'Sport',
  'Gifts'
];

const List<String> goalList = <String>[
  'Other',
  'Car',
  'Multimedia',
  'Investment',
  'Luxury',
];

const List<String> incomeList = <String>[
  'Other',
  'Borrow',
  'Gifts',
];

const List<String> incomeListMonthlyManage = <String>[
  'Other',
  'Salary',
  'Rental',
  'Earnings',
  'Revenue',
  'Child Support',
  'Parental Allowance'
];

const List<String> incomeListYearlyManage = <String>[
  'Other',
  'Salary',
  'Rental',
  'Earnings',
  'Revenue',
  'Child Support',
  'Parental Allowance'
];

const List<String> paymentListMonthlyManage = <String>[
  'Other',
  'Rent',
  'Home',
  'Insurance',
  'Electricity',
  'Phone',
  'Car',
  'Sport',
  'TV'
];

const List<String> paymentListYearlyManage = <String>[
  'Other',
  'Rent',
  'Home',
  'Insurance',
  'Electricity',
  'Phone',
  'Car',
  'Sport',
  'TV'
];

class DropDown extends ConsumerWidget {
  late CategoryConfiguration _categoryConfiguration;


   DropDown({required CategoryConfiguration categoryConfiguration,super.key}){
     _categoryConfiguration = categoryConfiguration;
   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String currentValue = ref.watch(testobjectbuilderProvider).categories;
     
    return Column(
      children: [
        const Text("Categories",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        DropdownButton<String>(
          iconSize: 0.0,
          value: currentValue,
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
            if(value != null) {
              ref.read(testobjectbuilderProvider.notifier).setCategory(value);
            }
          },
          items: _categoryConfiguration.categories.map<DropdownMenuItem<String>>((String value) {
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






