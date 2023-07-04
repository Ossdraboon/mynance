import 'package:flutter/material.dart';
import 'main.dart';
import 'package:MyNance/Widgets/layoutElements.dart';
import 'package:MyNance/Widgets/layoutButtons.dart';
//import 'Widgets/animatedBackground.dart';

//import 'package:metaballs/metaballs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                          hint: "Enter your Username", icon: Icons.person),
                      TextfieldPassword(
                          hint: "Enter your Password", icon: Icons.password),
                      const SizedBox(height: 20),
                      const MyTextButtonEmail(),
                      const SizedBox(height: 20),
                      const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Spacer(),
                            Spacer(),
                            SizedBox(height: 20),
                            LoginButton(),
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
                            hint: "Enter your Username", icon: Icons.person),
                        TextfieldPassword(
                            hint: "Enter your Password", icon: Icons.password),
                        const SizedBox(height: 20),
                        const MyTextButtonEmail(),
                        const SizedBox(height: 20),
                      ],
                    ),
                    const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Spacer(),
                          SizedBox(
                            height: 20,
                          ),
                          LoginButton(),
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
}

