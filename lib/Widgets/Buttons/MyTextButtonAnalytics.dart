import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyTextButtonAnalytics extends StatelessWidget {
  const MyTextButtonAnalytics({super.key});

  @override
  Widget build(BuildContext context) {



    return Container(
      decoration: BoxDecoration(
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
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          //padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 15),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/info');
        },
        child: const Text('more Information ...'),

      ),
    );
  }
}