import 'package:MyNance/Widgets/Buttons/MyBackButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widgets/Layouts/MyCustomeDivider.dart';
import 'main.dart';

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

//TODO 30.08.2023 Erstelle eine neue Seite für die Analyse der Jahres, Monates und Wochen Übersicht. User soll auswählen beim klicken, welcher Monat(Jahr oder Woche je nach Button), Ausgaben oder Einnahmen, welche Kategorie (oder alle) und nach diesen Kriterien wird die Datenbank gelesen, gefiltert und als Liste Dargestellt. BONUS die Werte werden in einem BarChart oder LineChart dargestellt.
//TODO    Du kannst dafür, eine Seite machen, die für alle 3 Buttons funktioniert und je nach Button Jahr, Monat oder Woche ausgibt, ober für jeden Button eine Eigene Seite
//TODO    Es brauchst eine Eingabe möglichkeit (am besten mit Dropdown Felder) wo der User die Filter Optionen einstellen kann.
//TODO    Bei der auswahl ist wichtig zu beachten, das Payment und Income unterschiedliche Kategorien haben
//TODO    Dazu einen Button der die Suche startet
//TODO    Inputs der Auswahl werden am besten mit Provider abgefragt und weitergegeben
//TODO    Ausdruck der Liste wie bei HistoryBox zum Beispiel

//TODO    Beispiel: User klickt auf Yearly, kommt auf die Seite, wählt das Jahr aus, wählt aus ob er Payments oder Incomes sehen will, wählt dann eine Kategorie aus und drückt den Button der die Inputs liest und übergibt und dann wird die Liste in einer Box ausgegeben.



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
                Navigator.of(context).pushNamed('/week'); //TODO Button zur WochenÜbersicht
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
            Navigator.of(context).pushNamed('/month'); //TODO Button zur MonatsÜbersicht
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
            Navigator.of(context).pushNamed('/year'); //TODO Button zur JahresÜbersicht
          },
        ),
        Text('Yearly'),
      ],
    );
  }
}


