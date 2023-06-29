import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

//import 'Widgets/animatedBackground.dart';

//import 'package:metaballs/metaballs.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    // var appState = context.watch<MyAppState>();
    return Stack(
      children: <Widget>[
        Animatedbackground(),
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/LogoRender.png",
                width: 600,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(13, 80, 201, 0.5),
                border: Border.all(
                    width: 3.0, color: colorScheme.onPrimaryContainer),
                borderRadius: BorderRadius.circular(5.0),
              ),
              height: 400,
              alignment: Alignment.center,
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      //todo implement Controller
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          // for below version 2 use this
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                          FilteringTextInputFormatter.digitsOnly

                        ],
                        decoration: const InputDecoration(
                            labelText: "add new payment",
                            hintText: "add new payment",
                            icon: Icon(Icons.payment)
                        )
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          // for below version 2 use this
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                          FilteringTextInputFormatter.digitsOnly

                        ],
                        decoration: const InputDecoration(
                            labelText: "add new income",
                            hintText: "add new income",
                            icon: Icon(Icons.money)
                        )
                    ),
                    Text("MAIN PAGE FUNCTION"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                    Text("Test feld für text"),
                    Text("second Textfield"),
                  ],
                ),
              ),
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
                            width: 3.0, color: colorScheme.onPrimaryContainer),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      height: 150,
                      child: const Center(
                        child:
                          ChartButton(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                            width: 3.0, color: colorScheme.onPrimaryContainer),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      height: 150,
                      child: const Column(
                        children: [
                          Text("Test text for show of asdfasdfasdfsaddfasdfasdf")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class ChartButton extends StatefulWidget {
  const ChartButton({super.key});

  @override
  State<ChartButton> createState() => _ChartButton();
}

class _ChartButton extends State<ChartButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.bar_chart, size: 80,),
          onPressed: () {
            Navigator.of(context).pushNamed('/info');
          },
        ),
        Text('INFO'),
      ],
    );
  }
}
