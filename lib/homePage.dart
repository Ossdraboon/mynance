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
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 30),
                      Numberfield(hint: "add new Payment", icon: Icons.payment),
                      Numberfield(hint: "add new Income", icon: Icons.money),
                      Numberfield(hint: "add new Goal", icon: Icons.pie_chart),
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 150),
                          Numberfield(
                              hint: "add new Payment", icon: Icons.payment),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: values
                                  .map((element) => QuickMoney(
                                        text: (-1 * element).toString(),
                                      ))
                                  .toList()),
                          SizedBox(height: 30),
                          Numberfield(
                              hint: "add new Income", icon: Icons.money),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: values
                                  .map((element) => QuickMoney(
                                        text: element.toString(),
                                      ))
                                  .toList()),
                          SizedBox(height: 30),
                          Numberfield(
                              hint: "add new Goal", icon: Icons.pie_chart),
                        ],
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(53, 20, 201, 0.5),
                          border: Border.all(
                              width: 3.0, color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        height: 180,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(
                                      width: 3.0,
                                      color: colorScheme.onPrimaryContainer),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 150,
                                child: const Center(
                                  child: ChartButton(),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  border: Border.all(
                                      width: 3.0,
                                      color: colorScheme.onPrimaryContainer),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 150,
                                child: const Column(
                                  children: [
                                    Text(
                                        "Test text for show of asdfasdfasdfsaddfasdfasdf")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
