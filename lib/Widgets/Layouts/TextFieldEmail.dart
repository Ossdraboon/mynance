import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




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