import 'package:MyNance/createAccountPage.dart';
import 'package:MyNance/infoChartPage.dart';
import 'package:MyNance/manageAccountPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:metaballs/metaballs.dart';
import 'loginPage.dart';
import 'homePage.dart';
import 'menuSettingsPage.dart';
import 'package:flutter/services.dart';

import 'createAccountPage.dart';
import 'manageAccountPage.dart';

import 'package:MyNance/Widgets/layoutElements.dart';
import 'package:MyNance/Widgets/layoutButtons.dart';

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
          '/create': (context) => const CreateAccount(),
          '/manage': (context) => const ManageAccount(),
          '/menu': (context) => const MenuSettings(),
          '/info': (context) => const InfoChart(),
          //'/week': (context =>
        },
        // home: const StartUpPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MenuItem {
  IconData? icon;
  String? label;

  MenuItem(IconData i, String label) {
    this.icon = i;
    this.label = label;
  }
}

class StartUpPage extends StatefulWidget {
  const StartUpPage({super.key});

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {
  var selectedIndex = -1;
  List<MenuItem> _menuItems = [
    MenuItem(Icons.home, "Home"),
    MenuItem(Icons.account_balance, "Account Balance"),
    MenuItem(Icons.settings, "Settings"),
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
    if(selectedIndex == -1) {
      selectedIndex = 0;
      final args = ModalRoute.of(context)!.settings.arguments as String?;
      if (args != null && args == "StartUpManage") {
          selectedIndex = 1;
      }
      if (args != null && args == "StartUpHome") {
        selectedIndex = 0;
      }
      if (args != null && args == "StartUpSettings") {
        selectedIndex = 2;
      }
    }
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const ManageAccount();
        break;
      case 2:
        page = const MenuSettings();
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
                      // if (value == 2) {
                      //   Navigator.of(context).pushNamed('/');
                      // } else {
                        setState(() {
                          selectedIndex = value;
                        });
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
                    backgroundColor: Colors.transparent,
                    extended: false,
                    destinations: getNavigationRailDestination(_menuItems),
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      // if (value == 2) {
                      //   Navigator.of(context).pushNamed('/');
                      // } else {
                        setState(() {
                          selectedIndex = value;
                        });
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
        color: const Color.fromARGB(255, 132, 23, 204),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 16, 192, 224),
          Color.fromARGB(255, 18, 57, 213),
        ], begin: Alignment.bottomRight, end: Alignment.topLeft),
        metaballs: 70,
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
