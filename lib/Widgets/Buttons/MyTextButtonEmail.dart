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
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: const LinearGradient(
          colors: <Color>[
            Color(0xFF0D47A1),
            Color(0xFF1976D2),
            Color(0xFF42A5F5),
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