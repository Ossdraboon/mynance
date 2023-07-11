import 'package:MyNance/Model/ChartSectionConfiguration.dart';
import 'package:MyNance/Widgets/Buttons/MyBackButton.dart';
import 'package:MyNance/Widgets/Layouts/InfoElement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widgets/Layouts/MyCustomeDivider.dart';
import 'main.dart';
import 'Widgets/Layouts/BarChart.dart';
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
                ),
              ),
            ],
          );
        } else {
          return Stack(
            children: <Widget>[
              const CircularParticleScreen(),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.white,
                      Colors.blue.withOpacity(0.5),
                      Colors.blue.withOpacity(0.3),
                      Colors.lightBlue.withOpacity(0.2),
                      Colors.cyan.withOpacity(0.1),
                    ],
                  ),
                  // color: const Color.fromRGBO(
                  //     15, 165, 210, 0.9),
                  border: Border.all(
                    color: const Color.fromRGBO(21, 80, 199, 0.3),
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  "assets/images/LogoRender.png",
                  width: 600,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Weekly(),
                    MyCostumeDivider(
                      boxheight: 10,
                      contheight: 3,
                      startline: 20,
                      endline: 20,
                    ),
                    Monthly(),
                    MyCostumeDivider(
                      boxheight: 10,
                      contheight: 3,
                      startline: 20,
                      endline: 20,
                    ),
                    Yearly(),
                    MyCostumeDivider(
                      boxheight: 10,
                      contheight: 3,
                      startline: 20,
                      endline: 20,
                    ),
                    const SizedBox(height: 10,),
                    MyBackButtonInfoSection(),
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

  Weekly({super.key,});

  @override
  State<Weekly> createState() => _Weekly();
}

class _Weekly extends State<Weekly> {
  @override
  Widget build(BuildContext context) {
    return
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.bar_chart,
                size: 80,
              ),
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
          icon: const Icon(
            Icons.area_chart,
            size: 80,
          ),
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
          icon: const Icon(
            Icons.query_stats,
            size: 80,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/year');
          },
        ),
        Text('Yearly'),
      ],
    );
  }
}


