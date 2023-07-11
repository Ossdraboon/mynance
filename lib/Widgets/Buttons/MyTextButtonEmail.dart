import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextButtonEmail extends StatelessWidget {
  const MyTextButtonEmail({super.key});

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

    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
          print("CALL TO HASSAN !!!");
        },
        child: const Text('Forgot your Email ...'),
      ),
    );
  }
}