import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widgets/Buttons/DeleteButton.dart';
import 'Widgets/Buttons/SaveButton.dart';
import 'main.dart';
import 'package:MyNance/Widgets/layoutElements.dart';
import 'package:MyNance/Widgets/layoutButtons.dart';


class ManageAccount extends StatelessWidget {
  const ManageAccount({super.key});


  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme
        .of(context)
        .colorScheme;

    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        if (constrains.maxWidth >= 600) {
          return Stack(
            children: <Widget>[
              //const Animatedbackground(),
              Image.asset(
                "assets/images/MyNanceSide-noBG.png",
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 350,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(60, 147, 183, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Text("INPUT FIX"),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 350,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(25, 54, 203, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Text("INPUT MONEY"),
                        ),
                      ),
                      const Row(
                        children: [
                          Spacer(),
                          SaveButton(),
                          Spacer(),
                          DeleteButton(),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Stack(
            children: <Widget>[
              //const Animatedbackground(),
              Image.asset(
                "assets/images/LogoRender.png",
                width: 600,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 350,
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(134, 137, 204, 0.5),
                            border: Border.all(
                                width: 3.0,
                                color: colorScheme.onPrimaryContainer),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text("INPUT FIX"),
                          ),
                        ),

                        Container(
                          height: 80,
                          width: 350,
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(25, 54, 203, 0.5),
                            border: Border.all(
                                width: 3.0,
                                color: colorScheme.onPrimaryContainer),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text("INPUT MONEY"),
                          ),
                        ),
                        const Row(
                          children: [
                            Spacer(),
                            SaveButton(),
                            Spacer(),
                            DeleteButton(),
                            Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}


class DropDownPayment extends StatefulWidget {
  const DropDownPayment({super.key});

  @override
  State<DropDownPayment> createState() => _DropDownPaymentState();
}

class _DropDownPaymentState extends State<DropDownPayment> {
  String dropdownValue = paymentList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
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
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(4, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(value)),
          ),
        );
      }).toList(),
    );
  }
}


