import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LoginButton extends StatelessWidget {
  LoginButton({super.key, required this.login});
  final Function login;


  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
      };
      if (states.contains(MaterialState.pressed)) {
        return Colors.blue;
      }
      return Colors.black;
    }


    return ElevatedButton(
      style: ButtonStyle(
        // animationDuration: Duration(seconds: 2),
        foregroundColor: MaterialStateProperty.resolveWith(getColor),
      ),
      onPressed: () {
        login(context);
        //Navigator.of(context).pushNamed('/home');

      },
      child: const Text('LOGIN'),
    );
  }
}


class LoginButtonDebug extends StatelessWidget {
  LoginButtonDebug({super.key});



  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
      };
      if (states.contains(MaterialState.pressed)) {
        return Colors.blue;
      }
      return Colors.black;
    }


    return ElevatedButton(
      style: ButtonStyle(
        // animationDuration: Duration(seconds: 2),
        foregroundColor: MaterialStateProperty.resolveWith(getColor),
      ),
      onPressed: () {
        //login(context);
        Navigator.of(context).pushNamed('/home');

      },
      child: const Text('DEBUG MODE'),
    );
  }
}