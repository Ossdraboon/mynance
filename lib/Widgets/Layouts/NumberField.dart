import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Model/MoneySectionConfiguration.dart';


class Numberfield extends StatefulWidget {

  late InputFieldConfiguration _inputFieldConfiguration;

  Numberfield({required InputFieldConfiguration inputFieldConfiguration, super.key}) {

    _inputFieldConfiguration = inputFieldConfiguration;
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
        labelText: widget._inputFieldConfiguration.text,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        hintText: widget._inputFieldConfiguration.hint,
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        border: InputBorder.none,
        icon: Icon(widget._inputFieldConfiguration.icon, color: Colors.blueAccent,size: 30,),
      ),
    );
  }
}