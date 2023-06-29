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
                      Textfield(hint: "Name", icon: Icons.person),
                      Textfield(hint: "Password", icon: Icons.password),
                      Textfield(hint: "Repeat Password", icon: Icons.password),
                      Textfield(hint: "Email", icon: Icons.alternate_email),
                      Numberfield(hint: "Phone Number", icon: Icons.phone_android),
                      BirthDate(),
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
                margin: EdgeInsetsDirectional.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: <Widget>[
                        Textfield(hint: "Name", icon: Icons.person),
                        Textfield(hint: "Password", icon: Icons.password),
                        Textfield(hint: "Repeat Password", icon: Icons.password),
                        Textfield(hint: "Email", icon: Icons.alternate_email),
                        Numberfield(hint: "Phone Number", icon: Icons.phone_android),
                        BirthDate(),
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

class Textfield extends StatefulWidget {
  late String _hint;
  late IconData _icon;

  Textfield({required String hint, required IconData icon, super.key}) {
    _hint = hint;
    _icon = icon;
  }

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 600,
      child: TextFormField(
        decoration: InputDecoration(
            labelText: widget._hint,
            iconColor: Colors.black,
            icon: Icon(widget._icon),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
            hintText: widget._hint),
      ),
    );
  }
}

class Numberfield extends StatefulWidget {
  late String _hint2;
  late IconData _icon2;

  Numberfield({required String hint, required IconData icon, super.key}) {
    _hint2 = hint;
    _icon2 = icon;
  }

  @override
  State<Numberfield> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<Numberfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 600,
      child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            // for below version 2 use this
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
            FilteringTextInputFormatter.digitsOnly

          ],
          decoration: InputDecoration(
              labelText: widget._hint2,
              hintText: widget._hint2,
              icon: Icon(widget._icon2),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
          )
      ),
    );
  }
}

class BirthDate extends StatefulWidget {
  const BirthDate({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<BirthDate> createState() => _BirthDateState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _BirthDateState extends State<BirthDate>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
  RestorableDateTime(DateTime(2023, 6, 29));  // TODO Now or actual Day???
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 800,
      child: OutlinedButton(
            onPressed: () {
              _restorableDatePickerRouteFuture.present();
            },
            child: const Text('Open Date Picker'),
      ),
    );
  }
}
