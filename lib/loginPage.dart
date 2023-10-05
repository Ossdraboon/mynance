import 'dart:developer';
import 'package:MyNance/Widgets/Layouts/TextFieldEmail.dart';
import 'package:MyNance/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Widgets/Layouts/TextField.dart';
import 'Widgets/Layouts/TextFieldPassword.dart';
import 'main.dart';
import 'package:MyNance/Widgets/Layouts/Dropdown.dart';
import 'package:MyNance/Widgets/Buttons/LoginButton.dart';
import 'package:MyNance/Widgets/Buttons/CreateAccountButton.dart';
import 'package:MyNance/Widgets/Buttons/MyTextButtonEmail.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'Widgets/animatedBackground.dart';

//import 'package:metaballs/metaballs.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  // firebase
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        if (constrains.maxWidth >= 600) {
          return Stack(
            children: <Widget>[
              //const CircularParticleScreen(),
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
                      TextfieldEmail(
                         controller: emailController,
                          hint: "Enter your Email", icon: Icons.email),
                      TextfieldPassword(
                          hint: "Enter your Password",controller: passwordController ,icon: Icons.password),
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
              //const CircularParticleScreen(),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.white,
                      Colors.blue.withOpacity(0.5),
                      Colors.blue.withOpacity(0.3),
                      Colors.lightBlue.withOpacity(0.2),
                      Colors.cyan.withOpacity(0.1),
                    ],
                  ),
                  // color: const Color.fromRGBO(
                  //     15, 165, 210, 0.9),
                  border: Border.all(
                    color: const Color.fromRGBO(21, 80, 199, 0.3),
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  "assets/images/LogoRender.png",
                  width: 600,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Form(
                key: _formKey,
                //alignment: Alignment.center,
                //margin: const EdgeInsetsDirectional.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          TextfieldEmail(
                              controller: emailController,
                              hint: "Enter your Email", icon: Icons.email),
                          TextfieldPassword(
                              hint: "Enter your Password",controller: passwordController ,icon: Icons.password),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyTextButtonEmail(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Spacer(),
                          LoginButton(login: performLogin),
                          const Spacer(),
                          const CreateAccountButton(),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginButtonDebug(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  void performLogin(BuildContext context) async {
    print("perform login: " + emailController.text + " " + passwordController.text);
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
            .then((uid) =>
        {
          Fluttertoast.showToast(msg: "Login Successful"),
          //Navigator.of(context).pushReplacement(
            //  MaterialPageRoute(builder: (context) => StartUpPage())),
          Navigator.of(context).pushNamed('/home')
        });
      } on FirebaseAuthException catch(e){
       print("Failed with error code:  ${e.code}");
       print(e.message);
      };
    }

  }
}
