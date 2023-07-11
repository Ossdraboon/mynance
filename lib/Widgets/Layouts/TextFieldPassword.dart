import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class TextfieldPassword extends StatefulWidget {
  late String _hint;
  late IconData _icon;
  late TextEditingController passwordController;

  TextfieldPassword({required String hint, required IconData icon,required TextEditingController controller ,super.key}) {
    _hint = hint;
    _icon = icon;
    passwordController = controller;
  }

  @override
  State<TextfieldPassword> createState() => _TextfieldPasswordState(passwordController);
}

class _TextfieldPasswordState extends State<TextfieldPassword> {
  TextEditingController passwordController;
  _TextfieldPasswordState(this.passwordController);

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
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          validator: (value){
            RegExp regex = new RegExp(r'^.{6,}$');
            if(value!.isEmpty){
              return ("Password is required for Login");
            }
            if(!regex.hasMatch(value)){
              return ("Please Enter a Valid Password(Min. 6 Character");
            }
          },
          onSaved: (value){
            passwordController.text = value!;
          },
          controller: passwordController,
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