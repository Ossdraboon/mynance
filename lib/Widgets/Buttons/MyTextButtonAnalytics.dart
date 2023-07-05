import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyTextButtonAnalytics extends StatelessWidget {
  const MyTextButtonAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blueGrey;
    }

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        //padding: const EdgeInsets.all(16.0),
        textStyle: const TextStyle(fontSize: 15),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/info');
      },
      child: const Text('more Information ...'),

    );
  }
}