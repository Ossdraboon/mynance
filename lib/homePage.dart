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
                  child: Container(
                    width: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 30),
                            Row(
                              children:<Widget> [
                                const Expanded(
                                    flex: 1,
                                    child: DropDownPayment()
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  flex: 5,
                                  child: Numberfield(
                                      hint: "add new Payment", icon: Icons.payment),
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: values
                                    .map((element) => QuickMoney(
                                  text: (-1 * element).toString(),
                                ))
                                    .toList()),
                            const SizedBox(height: 30),
                            Row(
                              children:<Widget> [
                                const Expanded(
                                    flex: 1,
                                    child: DropDownIncome()
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  flex: 5,
                                  child: Numberfield(
                                      hint: "add new Income", icon: Icons.money),
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: values
                                    .map((element) => QuickMoney(
                                  text: element.toString(),
                                ))
                                    .toList()),
                            const SizedBox(height: 30),
                            Row(
                              children:<Widget> [
                                const Expanded(
                                    flex: 1,
                                    child: DropDownGoals()
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  flex: 5,
                                  child: Numberfield(
                                      hint: "add new Goal", icon: Icons.pie_chart),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
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
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 10),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
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
                              SizedBox(width: 10),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3.0,
                                        color: colorScheme.onPrimaryContainer),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  height: 150,
                                  child: const Column(
                                    children: [
                                      Text(
                                          "Test text for show of asdfasdfasdfsaddfasdfasdf"),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                        SizedBox(
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
                          const SizedBox(height: 150),
                          Row(
                            children:<Widget> [
                              const Expanded(
                                  flex: 1,
                                  child: DropDownPayment()
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                flex: 5,
                                child: Numberfield(
                                    hint: "add new Payment", icon: Icons.payment),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: values
                                  .map((element) => QuickMoney(
                                        text: (-1 * element).toString(),
                                      ))
                                  .toList()),
                          const SizedBox(height: 30),
                          Row(
                            children:<Widget> [
                              const Expanded(
                                  flex: 1,
                                  child: DropDownIncome()
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                flex: 5,
                                child: Numberfield(
                                    hint: "add new Income", icon: Icons.money),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: values
                                  .map((element) => QuickMoney(
                                        text: element.toString(),
                                      ))
                                  .toList()),
                          const SizedBox(height: 30),
                          Row(
                            children:<Widget> [
                              const Expanded(
                                  flex: 1,
                                  child: DropDownIncome()
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                flex: 5,
                                child: Numberfield(
                                    hint: "add new Goal", icon: Icons.pie_chart),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
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
                        child: Row(
                          children: <Widget>[
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
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
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3.0,
                                      color: colorScheme.onPrimaryContainer),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 150,
                                child: const Column(
                                  children: [
                                    Text(
                                        "Test text for show of Weekly Information and Analytics"),
                                    SizedBox(height: 5,),
                                    Text(
                                        "Test text for show of Monthly Information and Analytics"),
                                    SizedBox(height: 5,),
                                    Text(
                                        "Test text for show of Yearly Information and Analytics"),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
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
