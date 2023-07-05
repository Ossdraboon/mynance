import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:MyNance/Widgets/Buttons/ChartButton.dart';

import 'Buttons/MyIconButton.dart';
import 'Layouts/PaymentElement.dart';






//Dynamic Layout for Pay-/Income-/GoalSection for Home- and AccountBalancePage



class DropDown extends StatefulWidget {
  late List _list;


   DropDown({required List list,super.key}){
     _list = list;
   }

  @override
  State<DropDown> createState() => _DropDownState();
}
class _DropDownState extends State<DropDown> {
  String dropdownValue = paymentList.first;    //dynamic list choose

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
          items: paymentList.map<DropdownMenuItem<String>>((String value) {
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




class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              MyIconButton(icon: Icons.delete_forever, size: 20),
              const SizedBox(
                width: 10,
              ),
              const Text("LIST of ITEMS"),
            ],
          ),
        ),
        const Divider(
          height: 2,
          thickness: 1,
          indent: 5,
          endIndent: 5,
          color: Colors.black,
        ),
      ],
    );
  }
}


