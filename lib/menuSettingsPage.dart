import 'package:MyNance/Widgets/Buttons/ResetEmailButton.dart';
import 'package:flutter/material.dart';
import 'Widgets/Buttons/LogoutButton.dart';
import 'Widgets/Buttons/SaveButton.dart';
import 'main.dart';




class MenuSettings extends StatelessWidget {
  const MenuSettings({super.key});


  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        if (constrains.maxWidth >= 600) {
          return Stack(
            children: <Widget>[
              const CircularParticleScreen(),
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
                      Container(
                      ),
                      SaveButtonSettingPage(),
                      ResetEmailButtonSettingPage(),
                      SizedBox(height: 30,),
                      LogoutButtonSettingPage(),
                    ],
                  ),
                ),
              ),
            ],
          );

        } else {

          return Stack(
            children: <Widget>[
              const CircularParticleScreen(),
              Image.asset(
                "assets/images/LogoRender.png",
                width: 600,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                        ),
                        SaveButtonSettingPage(),
                        ResetEmailButtonSettingPage(),
                        SizedBox(height: 60,),
                        LogoutButtonSettingPage(),
                      ],
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



