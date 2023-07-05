import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




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