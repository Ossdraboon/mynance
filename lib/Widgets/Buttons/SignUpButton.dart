import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {



    return Container(decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
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
    ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/home', arguments: "StartUpManage");
        },
        child: const Text('Sign Up'),
      ),
    );
  }
}