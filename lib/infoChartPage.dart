import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'Widgets/Layouts/Sandbox.dart';
//import 'Widgets/animatedBackground.dart';

//import 'package:metaballs/metaballs.dart';


class InfoChart extends StatelessWidget {
  const InfoChart({super.key});


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
                      Sandbox(
                        dayNames: ["Mo", "Di", "Mi"],
                        values: [23, 45, 56],
                      ),
                      // const Row(
                      //   children: [
                      //     Expanded(
                      //       child:
                      //       Weekly(),
                      //     ),
                      //     Expanded(
                      //       child:
                      //       Monthly(),
                      //     ),
                      //     Expanded(
                      //       child:
                      //       Yearly(),
                      //     ),
                      //   ],
                      // ),
                      const BackButton(),
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
                          height: 100,
                          width: 600,
                        ),
                        Sandbox(
                          dayNames: ["Mo", "Di", "Mi", "Do", "Fr", "Sa", "So"],
                          values: [23, 45, 56,33, 45, 67, 4],
                        ),
                        // const Row(
                        //   children: [
                        //     Expanded(
                        //         child:
                        //         Weekly(),
                        //     ),
                        //     Expanded(
                        //         child:
                        //         Monthly(),
                        //     ),
                        //     Expanded(
                        //         child:
                        //         Yearly(),
                        //     ),
                        //   ],
                        // ),
                        const BackButton(),
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

class Weekly extends StatefulWidget {
  const Weekly({super.key});

  @override
  State<Weekly> createState() => _Weekly();
}

class _Weekly extends State<Weekly> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.bar_chart, size: 80,),
          onPressed: () {
            Navigator.of(context).pushNamed('/week');
          },
        ),
        Text('Weekly'),
      ],
    );
  }
}

class Monthly extends StatefulWidget {
  const Monthly({super.key});

  @override
  State<Monthly> createState() => _Monthly();
}

class _Monthly extends State<Monthly> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.area_chart, size: 80,),
          onPressed: () {
            Navigator.of(context).pushNamed('/month');
          },
        ),
        Text('Monthly'),
      ],
    );
  }
}

class Yearly extends StatefulWidget {
  const Yearly({super.key});

  @override
  State<Yearly> createState() => _Yearly();
}

class _Yearly extends State<Yearly> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.query_stats, size: 80,),
          onPressed: () {
            Navigator.of(context).pushNamed('/year');
          },
        ),
        Text('Yearly'),
      ],
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
        Navigator.of(context).pushNamed('/home',arguments: "StartUpHome");
      },
      child: const Text('Back'),
    );
  }
}
