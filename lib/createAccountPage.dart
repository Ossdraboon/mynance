import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

//import 'Widgets/animatedBackground.dart';

//import 'package:metaballs/metaballs.dart';


class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});


  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        if (constrains.maxWidth >= 600) {
          return Stack(
            children: <Widget>[
              //const Animatedbackground(),
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
                        height: 80,
                        width: 350,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(134, 137, 204, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Text("EMAIL"),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 350,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(134, 137, 204, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Text("NAME"),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 80,
                              width: 350,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(134, 137, 204, 0.5),
                                border: Border.all(
                                    width: 3.0,
                                    color: colorScheme.onPrimaryContainer),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Text("AGE*"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 80,
                              width: 350,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(134, 137, 204, 0.5),
                                border: Border.all(
                                    width: 3.0,
                                    color: colorScheme.onPrimaryContainer),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Text("GENDER*"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 80,
                        width: 350,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(25, 54, 203, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Text("PASSWORT"),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 350,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(25, 54, 203, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Text("PHONE *"),
                        ),
                      ),
                      const Row(
                        children: [
                          Spacer(),
                          SignUpButton(),
                          Spacer(),
                          BackButton(),
                          Spacer(),
                        ],
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
              //const Animatedbackground(),
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
                          height: 80,
                          width: 350,
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(134, 137, 204, 0.5),
                            border: Border.all(
                                width: 3.0,
                                color: colorScheme.onPrimaryContainer),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text("EMAIL"),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: 350,
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(134, 137, 204, 0.5),
                            border: Border.all(
                                width: 3.0,
                                color: colorScheme.onPrimaryContainer),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text("NAME"),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 80,
                                width: 350,
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(134, 137, 204, 0.5),
                                  border: Border.all(
                                      width: 3.0,
                                      color: colorScheme.onPrimaryContainer),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  child: Text("AGE*"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 80,
                                width: 350,
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(134, 137, 204, 0.5),
                                  border: Border.all(
                                     width: 3.0,
                                      color: colorScheme.onPrimaryContainer),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  child: Text("GENDER*"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 80,
                          width: 350,
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(25, 54, 203, 0.5),
                            border: Border.all(
                                width: 3.0,
                                color: colorScheme.onPrimaryContainer),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text("PASSWORT"),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: 350,
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(25, 54, 203, 0.5),
                            border: Border.all(
                                width: 3.0,
                                color: colorScheme.onPrimaryContainer),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text("PHONE *"),
                          ),
                        ),
                        const Row(
                          children: [
                            Spacer(),
                            SignUpButton(),
                            Spacer(),
                            BackButton(),
                            Spacer(),
                          ],
                        ),
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

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blueGrey;
    }

    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(getColor),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/home',arguments: "StartUpManage");
      },
      child: const Text('Sign Up'),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blueGrey;
    }

    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(getColor),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/');
      },
      child: const Text('Back'),
    );
  }
}
