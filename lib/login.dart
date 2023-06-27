import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:metaballs/metaballs.dart';

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
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = LoginPage();
        break;
      case 1:
        page = HomePage();
        break;
      case 2:
        page = const Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
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
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.logout),
                        label: 'Logout',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.account_balance),
                        label: 'Account Balance',
                      ),
                      // BottomNavigationBarItem(
                      //     icon: Icon(Icons.add_chart),
                      //     label: "Add List",
                      // ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
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
                    backgroundColor: Colors.lightBlueAccent,
                    extended: false,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.logout),
                        label: Text('Logout'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.account_balance),
                        label: Text('Account Balance'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text("Test feld für text"),
          const Text("second Textfield"),
          const Text("Test feld für text"),
          const Text("second Textfield"),
          const Text("Test feld für text"),
          const Text("second Textfield"),
          const Text("Test feld für text"),
          const Text("second Textfield"),
          Image.asset(
            "assets/images/MyNanceDark.png",
            width: 600,
            height: 300,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        if (constrains.maxWidth >= 600) {
          return Stack(
            children: <Widget>[
              Animatedbackground(),
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
                          color: const Color.fromRGBO(
                              60, 147, 183, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              iconColor: Colors.black,
                                icon: Icon(Icons.person),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                ),
                                labelText: "Enter your Username"),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 350,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(
                              53, 20, 201, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                                iconColor: Colors.black,
                                icon: Icon(Icons.person),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                ),
                                labelText: "Enter your Password"),
                          ),
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
          return Stack(
            children: <Widget>[
              Animatedbackground(),
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
                          color: const Color.fromRGBO(
                              134, 137, 204, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                                iconColor: Colors.black,
                                icon: Icon(Icons.person),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                ),
                                labelText: "Enter your Username"),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 350,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(
                              25, 54, 203, 0.5),
                          border: Border.all(
                              width: 3.0,
                              color: colorScheme.onPrimaryContainer),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                                iconColor: Colors.black,
                                icon: Icon(Icons.person),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                ),
                                labelText: "Enter your Password"),
                          ),
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
          );
        }
      }),
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
        child: Text('METABALLS'));
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
      onPressed: () {},
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
