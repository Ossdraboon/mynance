import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldEmail extends StatefulWidget {
  late String _hint;
  late IconData _icon;
  late TextEditingController emailController;


  TextfieldEmail({required String hint, required IconData icon, required TextEditingController controller ,super.key}) {
    _hint = hint;
    _icon = icon;
    emailController = controller;
  }

  @override
  State<TextfieldEmail> createState() => _TextfieldEmailState();
}

class _TextfieldEmailState extends State<TextfieldEmail> {
  final TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 600,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          //regex for email
          if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
            return ("Please Enter a valid Email");
          }
          return null;
        },
        onSaved: (value){
          emailController.text = value!;
        },
        controller: emailController,
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
