import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
    return TextFormField(
      style: const TextStyle(color: Colors.white, fontSize: 25),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
            RegExp(r'^(?=\D*(?:\d\D*){1,12}$)\d+(?:\.\d{0,2})?$')),
      ],
      decoration: InputDecoration(
        labelText: widget._hint2,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        hintText: widget._hint2,
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        border: InputBorder.none,
        icon: Icon(widget._icon2, color: Colors.blueAccent,size: 30,),
      ),
    );
  }
}