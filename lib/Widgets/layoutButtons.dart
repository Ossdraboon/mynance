import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MyNance/loginPage.dart';

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
        Navigator.of(context).pushNamed('/home', arguments: "StartUpManage");
      },
      child: const Text('Sign Up'),
    );
  }
}

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

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

class LoginButton extends StatelessWidget {
  LoginButton({super.key});
  //final Function login;


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

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

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
        Navigator.of(context).pushNamed('/create');
      },
      child: const Text('CREATE'),
    );
  }
}

class MyTextButtonEmail extends StatelessWidget {
  const MyTextButtonEmail({super.key});

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

    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: const LinearGradient(
          colors: <Color>[
            Color(0xFF0D47A1),
            Color(0xFF1976D2),
            Color(0xFF42A5F5),
          ],
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          //padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 15),
        ),
        onPressed: () {
          print("CALL TO HASSAN !!!");
        },
        child: const Text('Forgot your Email ...'),
      ),
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
          icon: const Icon(
            Icons.bar_chart,
            size: 80,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/info');
          },
        ),
        Text('INFO'),
      ],
    );
  }
}

class QuickMoney extends StatefulWidget {
  late String _text;

  QuickMoney({required String text, super.key}) {
    _text = text;
  }

  @override
  State<QuickMoney> createState() => _QuickMoney();
}

class _QuickMoney extends State<QuickMoney> {
  @override
  Widget build(BuildContext context) {
    return
        Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white,
                Colors.blue.withOpacity(0.9),
                Colors.blue.withOpacity(0.9),
                Colors.lightBlue.withOpacity(0.8),
                Colors.cyan.withOpacity(0.1),
              ],
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              // color: const Color.fromRGBO(21, 80, 199, 0.3),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.7),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              //padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 18),
            ),
            onPressed: () {
              print("paid: , ${widget._text}");
            },
            child: Text("€${widget._text}"),
          ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

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
        //Navigator.of(context).pushNamed('/create');
        print("Saved Input");
      },
      child: const Text('Save'),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

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
        //Navigator.of(context).pushNamed('/home');
        print("Delete Input");
      },
      child: const Text('Delete'),
    );
  }
}

class MyTextButtonAnalytics extends StatelessWidget {
  const MyTextButtonAnalytics({super.key});

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

    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          //padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 15),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/info');
        },
        child: const Text('more Information ...'),

    );
  }
}



class MyIconButton extends StatefulWidget {
  late IconData _icon;
  late double _size;


  MyIconButton({required IconData icon,required double size, super.key}) {
    _icon = icon;
    _size = size;
  }

  @override
  State<MyIconButton> createState() => _MyIconButton();
}

class _MyIconButton extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget._icon,size:widget._size,),
      onPressed: () {
        print("Delete Item from List");
      },
    );
  }
}