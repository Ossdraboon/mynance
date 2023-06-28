import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:metaballs/metaballs.dart';
import 'loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'MyNance',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          //brightness: Brightness.dark
        ),
        routes: {
          '/': (context) => const LoginPage(),
          '/home': (context) => const StartUpPage(),
        },
        // home: const StartUpPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class StartUpPage extends StatefulWidget {
  const StartUpPage({super.key});

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

class MenuItem {
  IconData? icon;
  String? label;

  MenuItem(IconData i, String label) {
    this.icon = i;
    this.label = label;
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    // var appState = context.watch<MyAppState>();
    return Stack(
      children: <Widget>[
        //Animatedbackground(),
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
              child: const SingleChildScrollView(
                child: Column(
                  children: [
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                            width: 3.0, color: colorScheme.onPrimaryContainer),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      height: 150,
                      child: const Center(
                        child: Icon(
                          Icons.add_chart,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
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

class _StartUpPageState extends State<StartUpPage> {
  var selectedIndex = 0;
  List<MenuItem> _menuItems = [
    MenuItem(Icons.home, "Home"),
    MenuItem(Icons.account_balance, "Account Balance"),
    MenuItem(Icons.logout, "Logout"),
  ];

  List<BottomNavigationBarItem> getBottomTabs(List<MenuItem> tabs) {
    return tabs
        .map(
          (item) => BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
          ),
        )
        .toList();
  }

  List<NavigationRailDestination> getNavigationRailDestination(
      List<MenuItem> tabs) {
    return tabs
        .map(
          (item) => NavigationRailDestination(
            icon: Icon(item.icon),
            label: Text((item.label ?? "nix")),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const Placeholder();
        break;
      case 2:
        page = const Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    items: getBottomTabs(_menuItems),
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      if (value == 2) {
                        Navigator.of(context).pushNamed('/');
                      } else {
                        setState(() {
                          selectedIndex = value;
                        });
                      }
                    },
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    backgroundColor: Colors.lightBlueAccent,
                    extended: false,
                    destinations: getNavigationRailDestination(_menuItems),
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      if (value == 2) {
                        Navigator.of(context).pushNamed('/');
                      } else {
                        setState(() {
                          selectedIndex = value;
                        });
                      }
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}

class Animatedbackground extends StatelessWidget {
  const Animatedbackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Metaballs(
        effect: MetaballsEffect.follow(
          growthFactor: 1,
          smoothing: 1,
          radius: 0.5,
        ),
        color: const Color.fromARGB(255, 9, 67, 155),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 85, 36, 182),
          Color.fromARGB(255, 20, 180, 201),
        ], begin: Alignment.bottomRight, end: Alignment.topLeft),
        metaballs: 50,
        animationDuration: const Duration(milliseconds: 1000),
        speedMultiplier: 1,
        bounceStiffness: 3,
        minBallRadius: 15,
        maxBallRadius: 40,
        glowRadius: 0.7,
        glowIntensity: 0.6,
        child: const Text('METABALLS'));
  }
}
