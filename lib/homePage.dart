import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'package:MyNance/Widgets/layoutElements.dart';
import 'package:MyNance/Widgets/layoutButtons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var values = [5, 10, 20, 50, 100];

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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 30),
                            Column(
                              children: <Widget>[
                                ExpansionTile(
                                  title: Text('Add New Payment here...'),
                                  //subtitle: Text('do i need that?'),
                                  controlAffinity: ListTileControlAffinity.leading,
                                  children: <Widget>[
                                    const PaymentSection(),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: values
                                            .map((element) => QuickMoney(
                                          text: (-1 * element).toString(),
                                        ))
                                            .toList()),

                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              height: 20,
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: <Widget>[
                                ExpansionTile(
                                  title: Text('Add New Income here...'),
                                  //subtitle: Text('do i need that?'),
                                  controlAffinity: ListTileControlAffinity.leading,
                                  children: <Widget>[
                                    const IncomeSection(),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: values
                                            .map((element) => QuickMoney(
                                          text: (1 * element).toString(),
                                        ))
                                            .toList()),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              height: 20,
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: <Widget>[
                                ExpansionTile(
                                  title: Text('Add New Goal here...'),
                                  //subtitle: Text('do i need that?'),
                                  controlAffinity: ListTileControlAffinity.leading,
                                  children: <Widget>[
                                    const GoalSection(),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: values
                                            .map((element) => QuickMoney(
                                          text: (1 * element).toString(),
                                        ))
                                            .toList()),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              height: 20,
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 20),
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
                          child: const InfoSection(),
                        ),
                        const SizedBox(
                          height: 30,
                        )
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
                          title: Text('Add New Payment here...'),
                          //subtitle: Text('do i need that?'),
                          controlAffinity: ListTileControlAffinity.leading,
                          children: <Widget>[
                            const PaymentSection(),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: values
                                    .map((element) => QuickMoney(
                                  text: (-1 * element).toString(),
                                ))
                                    .toList()),
                          ],
                        ),
                      ],
                    ),


                          const Divider(
                            height: 20,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: <Widget>[
                              ExpansionTile(
                                title: Text('Add New Income here...'),
                                //subtitle: Text('do i need that?'),
                                controlAffinity: ListTileControlAffinity.leading,
                                children: <Widget>[
                                  const IncomeSection(),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: values
                                          .map((element) => QuickMoney(
                                        text: (1 * element).toString(),
                                      ))
                                          .toList()),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: <Widget>[
                              ExpansionTile(
                                title: Text('Add New Goal here...'),
                                //subtitle: Text('do i need that?'),
                                controlAffinity: ListTileControlAffinity.leading,
                                children: <Widget>[
                                  const GoalSection(),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: values
                                          .map((element) => QuickMoney(
                                        text: (1 * element).toString(),
                                      ))
                                          .toList()),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 20),
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
                        child: InfoSection(),
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

