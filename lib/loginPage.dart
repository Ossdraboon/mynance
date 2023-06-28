import 'package:flutter/material.dart';
import 'Widgets/animatedBackground.dart';

//import 'package:metaballs/metaballs.dart';
//import 'main.dart';


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
              //Animatedbackground(),
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
                          color: const Color.fromRGBO(60, 147, 183, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: TextfieldUsername(),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 350,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(53, 20, 201, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: TextfieldPassword(),
                        ),
                      ),
                      const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Spacer(),
                            Spacer(),
                            SizedBox(
                              height: 20,
                            ),
                            LoginButton(),
                            Spacer(),
                            CreateButton(),
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
          return SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                //Animatedbackground(),
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/LogoRender.png",
                          width: 600,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            child: TextfieldUsername(),
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
                            child: TextfieldPassword(),
                          ),
                        ),
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
                          CreateButton(),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}



class TextfieldPassword extends StatelessWidget {
  const TextfieldPassword({
    super.key,
  });

  @override
Widget build(BuildContext context) {
  return TextFormField(
    decoration: InputDecoration(
        iconColor: Colors.black,
        icon: const Icon(Icons.password),
        enabledBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
        hintText: "Enter your Password"),
  );
}
}

class TextfieldUsername extends StatelessWidget {
  const TextfieldUsername({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          iconColor: Colors.black,
          icon: const Icon(Icons.person),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
          ),
          hintText: "Enter your Username"),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
      };
      if (states.contains(MaterialState.pressed)) {
        return Colors.blue;
      }
      return Colors.black;
    }

    return ElevatedButton(
      style: ButtonStyle(
        // animationDuration: Duration(seconds: 2),
        foregroundColor: MaterialStateProperty.resolveWith(getColor),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/home');
      },
      child: const Text('LOGIN'),
    );
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

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
        print(const Text("test"));
      },
      child: const Text('CREATE'),
    );
  }
}

