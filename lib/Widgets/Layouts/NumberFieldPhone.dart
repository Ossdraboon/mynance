import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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