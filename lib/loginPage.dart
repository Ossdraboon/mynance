import 'dart:developer';
import 'package:MyNance/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Widgets/Layouts/TextField.dart';
import 'Widgets/Layouts/TextFieldPassword.dart';
import 'main.dart';
import 'package:MyNance/Widgets/layoutElements.dart';
import 'package:MyNance/Widgets/Buttons/LoginButton.dart';
import 'package:MyNance/Widgets/Buttons/CreateAccountButton.dart';
import 'package:MyNance/Widgets/Buttons/MyTextButtonEmail.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'Widgets/animatedBackground.dart';

//import 'package:metaballs/metaballs.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        if (constrains.maxWidth >= 600) {
          return Stack(
            children: <Widget>[
              const Animatedbackground(),
              Image.asset(
                "assets/images/MyNanceSide-noBG.png",
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Textfield(
                          hint: "Enter your Email", icon: Icons.email),
                      TextfieldPassword(
                          hint: "Enter your Password", icon: Icons.password),
                      const SizedBox(height: 20),
                      const MyTextButtonEmail(),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Spacer(),
                            Spacer(),
                            SizedBox(height: 20),
                            LoginButton(login: performLogin),
                            Spacer(),
                            CreateAccountButton(),
                            Spacer(),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Stack(
            children: <Widget>[
              const Animatedbackground(),
              Image.asset(
                "assets/images/LogoRender.png",
                width: 600,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsetsDirectional.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: <Widget>[
                        Textfield(
                            hint: "Enter your Email", icon: Icons.email),
                        TextfieldPassword(
                            hint: "Enter your Password", icon: Icons.password),
                        const SizedBox(height: 20),
                        const MyTextButtonEmail(),
                        const SizedBox(height: 20),
                      ],
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Spacer(),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginButton(login: performLogin),
                          Spacer(),
                          CreateAccountButton(),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }


  void performLogin(){
    print("Hello World!");
  }

}
