import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Providers/accountCreateProvider.dart';


class SignUpButton extends ConsumerWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {



    return Container(decoration: BoxDecoration(

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
      border: Border.all(
        color: Colors.white.withOpacity(0.5),
        // color: const Color.fromRGBO(21, 80, 199, 0.3),
        width: 0,
      ),
      borderRadius: BorderRadius.circular(25.0),
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(2, 2), // changes position of shadow
        ),
      ],
    ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
            String name = ref.watch(accountCreateBuilderProvider).name;

          FocusScope.of(context).unfocus();

            print("name ist :" +name);
          //Navigator.of(context).pushNamed('/home', arguments: "StartUpManage");
        },
        child: const Text('Sign Up'),
      ),
    );
  }
}