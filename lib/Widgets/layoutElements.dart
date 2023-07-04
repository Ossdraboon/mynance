import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'layoutButtons.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Textfield extends StatefulWidget {
  late String _hint;
  late IconData _icon;

  Textfield({required String hint, required IconData icon, super.key}) {
    _hint = hint;
    _icon = icon;
  }

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 600,
      child: TextFormField(
        decoration: InputDecoration(
            labelText: widget._hint,
            iconColor: Colors.black,
            icon: Icon(widget._icon),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
            hintText: widget._hint),
      ),
    );
  }
}

class TextfieldEmail extends StatefulWidget {
  late String _hint;
  late IconData _icon;

  TextfieldEmail({required String hint, required IconData icon, super.key}) {
    _hint = hint;
    _icon = icon;
  }

  @override
  State<TextfieldEmail> createState() => _TextfieldEmailState();
}

class _TextfieldEmailState extends State<TextfieldEmail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 600,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,


        decoration: InputDecoration(
            labelText: widget._hint,
            iconColor: Colors.black,
            icon: Icon(widget._icon),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
            hintText: widget._hint),
      ),
    );
  }
}


class Numberfield extends StatefulWidget {
  late String _hint2;
  late IconData _icon2;

  Numberfield({required String hint, required IconData icon, super.key}) {
    _hint2 = hint;
    _icon2 = icon;
  }

  @override
  State<Numberfield> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<Numberfield> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 600,
      child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^(?=\D*(?:\d\D*){1,12}$)\d+(?:\.\d{0,2})?$')),
          ],
          decoration: InputDecoration(
            labelText: widget._hint2,
            hintText: widget._hint2,
            icon: Icon(widget._icon2),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
          )),
    );
  }
}


class NumberfieldPhone extends StatefulWidget {
  late String _hint2;
  late IconData _icon2;

  NumberfieldPhone({required String hint, required IconData icon, super.key}) {
    _hint2 = hint;
    _icon2 = icon;
  }

  @override
  State<NumberfieldPhone> createState() => _NumberFieldPhoneState();
}


class _NumberFieldPhoneState extends State<NumberfieldPhone> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 600,
      child: TextFormField(
          keyboardType: TextInputType.phone,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            labelText: widget._hint2,
            hintText: widget._hint2,
            icon: Icon(widget._icon2),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
          )),
    );
  }
}



class LoginPasswort extends StatelessWidget {
  const LoginPasswort({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          iconColor: Colors.black,
          icon: const Icon(Icons.password),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
          ),
          hintText: "Enter your Password"),
    );
  }
}

class LoginUsername extends StatelessWidget {
  const LoginUsername({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          iconColor: Colors.black,
          icon: const Icon(Icons.person),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
          ),
          hintText: "Enter your Username"),
    );
  }
}

class LoginContainer2 extends StatelessWidget {
  const LoginContainer2({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 350,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(25, 54, 203, 0.5),
        border: Border.all(width: 3.0, color: colorScheme.onPrimaryContainer),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 350,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(134, 137, 204, 0.5),
        border: Border.all(width: 3.0, color: colorScheme.onPrimaryContainer),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}

const List<String> paymentList = <String>[
  'Other', 'Food', 'Clothing', 'Children','Health', 'Travel', 'Car', 'Sport','Gifts'
];

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
      style: const TextStyle(color: Colors.black),
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
          child: Text(value),
        );
      }).toList(),
    );
  }
}

const List<String> incomeList = <String>['Other', 'Borrow', 'Gifts',];

class DropDownIncome extends StatefulWidget {
  const DropDownIncome({super.key});

  @override
  State<DropDownIncome> createState() => _DropDownIncomeState();
}

class _DropDownIncomeState extends State<DropDownIncome> {
  String dropdownValue = incomeList.first;

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
      items: incomeList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

const List<String> goalList = <String>['Other', 'Car', 'Multimedia', 'Investment', 'Luxury',];

class DropDownGoals extends StatefulWidget {
  const DropDownGoals({super.key});

  @override
  State<DropDownGoals> createState() => _DropDownGoalsState();
}

class _DropDownGoalsState extends State<DropDownGoals> {
  String dropdownValue = goalList.first;

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
      items: goalList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 3.0,
                  color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 150,
            child: const Center(
              child: ChartButton(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 3.0,
                  color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 150,
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      "Test text for show of Day Information and Analytics"),
                  SizedBox(height: 5,),
                  Text(
                      "Test text for show of Weekly Information and Analytics"),
                  SizedBox(height: 5,),
                  Text(
                      "Test text for show of Monthly Information and Analytics"),
                  SizedBox(height: 5,),
                  Text(
                      "Test text for show of Yearly Information and Analytics"),
                  SizedBox(height: 5,),
                  Text(
                      "Test text for show of Overall Information and Analytics"),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class GoalSection extends StatelessWidget {
  const GoalSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children:<Widget> [
        const Expanded(
            flex: 3,
            child: DropDownGoals()
        ),
        const SizedBox(width: 10,),
        Expanded(
          flex: 9,
          child: Numberfield(
              hint: "add new Goal", icon: Icons.pie_chart),
        ),
      ],
    );
  }
}

class IncomeSection extends StatelessWidget {
  const IncomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children:<Widget> [
        const Expanded(
            flex: 3,
            child: DropDownIncome()
        ),
        const SizedBox(width: 10,),
        Expanded(
          flex: 9,
          child: Numberfield(
              hint: "add new Income", icon: Icons.money),
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
      children:<Widget> [
        const Expanded(
            flex: 3,
            child: DropDownPayment()
        ),
        const SizedBox(width: 10,),
        Expanded(
          flex: 9,
          child: Numberfield(
              hint: "add new Payment", icon: Icons.payment),
        ),
      ],
    );
  }
}


const List<String> paymentListManage = <String>[
  'Other', 'Rent', 'Home', 'Insurance', 'Electricity', 'Phone', 'Car', 'Sport','TV'
];

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
      children:<Widget> [
        const Expanded(
            flex: 3,
            child: DropDownPaymentManage()
        ),
        const SizedBox(width: 10,),
        Expanded(
          flex: 9,
          child: Numberfield(
              hint: "Set your Payments", icon: Icons.payment),
        ),
      ],
    );
  }
}

const List<String> incomeListManage = <String>[
  'Other', 'Salary', 'Rental', 'Earnings', 'Revenue', 'Child Support', 'Parental Allowance'
];

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
      children:<Widget> [
        const Expanded(
            flex: 3,
            child: DropDownIncomeManage()
        ),
        const SizedBox(width: 10,),
        Expanded(
          flex: 9,
          child: Numberfield(
              hint: "Set your Incomes", icon: Icons.money),
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
              const SizedBox(width: 10,),
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

