import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

import 'package:MyNance/Widgets/layoutElements.dart';
import 'package:MyNance/Widgets/layoutButtons.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({super.key});

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
                margin: const EdgeInsetsDirectional.all(10),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 30),
                            PaymentSectionManage(),
                            SizedBox(height: 20),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 3.0,
                                color: colorScheme.onPrimaryContainer),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          height: 180,
                          width: 600,
                          child: const SingleChildScrollView(
                            child: Column(
                              children: [
                                ListItem(),
                                ListItem(),
                                ListItem(),
                                ListItem(),
                                ListItem(),
                                ListItem(),
                              ],
                            ),
                          ),

                        ),
                        const Divider(
                          height: 40,
                          thickness: 2,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.black,
                        ),
                        const Column(
                          children: [
                            IncomeSectionManage(),
                            SizedBox(height: 20),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 3.0,
                                color: colorScheme.onPrimaryContainer),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          height: 180,
                          width: 600,
                          child: const SingleChildScrollView(
                            child: Column(
                              children: [
                                ListItem(),
                                ListItem(),
                                ListItem(),
                                ListItem(),
                                ListItem(),
                                ListItem(),
                              ],
                            ),
                          ),

                        ),
                      ],
                    ),
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 170),
                          Column(
                            children: <Widget>[
                              ExpansionTile(
                                title: const Text('Set your monthly Payment here...'),
                                //subtitle: Text('do i need that?'),
                                controlAffinity: ListTileControlAffinity.leading,
                                children: <Widget>[
                                  const PaymentSectionManage(),
                                  const SizedBox(height: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3.0,
                                          color: colorScheme.onPrimaryContainer),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    height: 220,
                                    width: 500,
                                    child: const SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ListItem(),
                                          ListItem(),
                                          ListItem(),
                                          ListItem(),
                                          ListItem(),
                                          ListItem(),
                                        ],
                                      ),
                                    ),

                                  ),
                                  const SaveButton(),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        height: 10,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.black,
                      ),
                      Column(
                        children: <Widget>[
                          ExpansionTile(
                            title: const Text('Set your monthly Income here...'),
                            //subtitle: Text('do i need that?'),
                            controlAffinity: ListTileControlAffinity.leading,
                            children: <Widget>[
                              const IncomeSectionManage(),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3.0,
                                      color: colorScheme.onPrimaryContainer),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 220,
                                width: 500,
                                child: const SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ListItem(),
                                      ListItem(),
                                      ListItem(),
                                      ListItem(),
                                      ListItem(),
                                      ListItem(),
                                    ],
                                  ),
                                ),

                              ),
                              const SaveButton(),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}


