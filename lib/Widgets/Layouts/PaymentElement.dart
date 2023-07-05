import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'NumberField.dart';


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
const List<String> paymentListManage = <String>[
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



//payment
class DropDownPayment extends StatefulWidget {
  const DropDownPayment({super.key});

  @override
  State<DropDownPayment> createState() => _DropDownPaymentState();
}

class _DropDownPaymentState extends State<DropDownPayment> {
  String dropdownValue = paymentList.first;

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

class PaymentSection extends StatelessWidget {
  const PaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 10,
        ),
        const Expanded(flex: 4, child: DropDownPayment()),
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
            child: Numberfield(hint: "add new Payment", icon: Icons.payment),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}


class DropDownPaymentManage extends StatefulWidget {
  const DropDownPaymentManage({super.key});

  @override
  State<DropDownPaymentManage> createState() => _DropDownPaymentManageState();
}

class _DropDownPaymentManageState extends State<DropDownPaymentManage> {
  String dropdownValue = paymentListManage.first;

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
      items: paymentListManage.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class PaymentSectionManage extends StatelessWidget {
  const PaymentSectionManage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(flex: 3, child: DropDownPaymentManage()),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 9,
          child: Numberfield(hint: "Set your Payments", icon: Icons.payment),
        ),
      ],
    );
  }
}
//