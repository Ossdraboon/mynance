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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(decoration: BoxDecoration(
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
        // color: const Color.fromRGBO(
        //     15, 165, 210, 0.9),
        border: Border.all(
          color: const Color.fromRGBO(21, 80, 199, 0.3),
          width: 0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
        child: TextFormField(
            style: const TextStyle(color: Colors.white, fontSize: 25),
            keyboardType: TextInputType.phone,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: widget._hint2,
              labelStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
              hintText: widget._hint2,
              hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
              iconColor: Colors.blueAccent,
              icon: Icon(widget._icon2),

            )),
      ),
    );
  }
}