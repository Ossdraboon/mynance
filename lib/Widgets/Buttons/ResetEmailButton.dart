import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResetEmailButtonSettingPage extends StatelessWidget {
  const ResetEmailButtonSettingPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Container(
      width: 200,
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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          print("Reset Email");
          Navigator.of(context).pushNamed('/create');
        },
        child: const Text('Reset Email'),
      ),
    );
  }
}