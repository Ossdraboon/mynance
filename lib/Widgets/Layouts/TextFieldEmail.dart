import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldEmail extends StatefulWidget {
  late String _hint;
  late IconData _icon;
  late TextEditingController emailController;

  TextfieldEmail(
      {required String hint,
      required IconData icon,
      required TextEditingController controller,
      super.key}) {
    _hint = hint;
    _icon = icon;
    emailController = controller;
  }

  @override
  State<TextfieldEmail> createState() => _TextfieldEmailState(emailController);
}

class _TextfieldEmailState extends State<TextfieldEmail> {
  TextEditingController emailController;

  _TextfieldEmailState(this.emailController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
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
          onSaved: (value) {
            emailController.text = value!;
          },
          controller: emailController,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: widget._hint,
            labelStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
            iconColor: Colors.blueAccent,
            icon: Icon(widget._icon),
            hintText: widget._hint,
            hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
