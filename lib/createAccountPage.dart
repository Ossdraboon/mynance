import 'package:flutter/material.dart';
import 'package:MyNance/Widgets/layoutElements.dart';
import 'package:MyNance/Widgets/layoutButtons.dart';
import 'main.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    //var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        if (constrains.maxWidth >= 600) {
          return Stack(
            children: <Widget>[
              const Animatedbackground(),
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
                      const SizedBox(height: 30),
                      Textfield(hint: "Name", icon: Icons.person),
                      Textfield(hint: "Password", icon: Icons.password),
                      Textfield(hint: "Repeat Password", icon: Icons.password),
                      Textfield(hint: "Email", icon: Icons.alternate_email),
                      Numberfield(
                          hint: "Phone Number", icon: Icons.phone_android),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 150),
                          const Icon(Icons.calendar_month),
                          const SizedBox(
                            height: 30,
                            width: 18,
                          ),
                          const BirthDate(),
                          const SizedBox(
                            height: 30,
                            width: 9,
                          ),
                          const Icon(Icons.transgender),
                          const SizedBox(
                            height: 30,
                            width: 9,
                          ),
                          SizedBox(
                            height: 70,
                            width: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: const GenderPick(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: <Widget>[
                          Spacer(),
                          SignUpButton(),
                          Spacer(),
                          MyBackButton(),
                          Spacer(),
                        ],
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Stack(
            children: <Widget>[
              const Animatedbackground(),
              Image.asset(
                "assets/images/LogoRender.png",
                width: 600,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsetsDirectional.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 100),
                          Textfield(hint: "Name", icon: Icons.person),
                          Textfield(hint: "Password", icon: Icons.password),
                          Textfield(
                              hint: "Repeat Password", icon: Icons.password),
                          Textfield(hint: "Email", icon: Icons.alternate_email),
                          Numberfield(
                              hint: "Phone Number",
                              icon: Icons.phone_android_outlined),
                          const SizedBox(height: 20),
                          const Row(
                            children: [
                              Icon(Icons.calendar_month),
                              SizedBox(
                                height: 30,
                                width: 18,
                              ),
                              BirthDate(),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              const Icon(Icons.transgender),
                              const SizedBox(
                                height: 30,
                                width: 18,
                              ),
                              SizedBox(
                                height: 70,
                                width: 160,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  child: const GenderPick(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          const Row(
                            children: <Widget>[
                              Spacer(),
                              SignUpButton(),
                              Spacer(),
                              MyBackButton(),
                              Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}

const List<String> list = <String>['Auto', 'Male', 'Female', 'Other'];

class GenderPick extends StatefulWidget {
  const GenderPick({super.key});

  @override
  State<GenderPick> createState() => _GenderPickState();
}

class _GenderPickState extends State<GenderPick> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.select_all_rounded),
      style: const TextStyle(color: Colors.black),
      alignment: Alignment.center,
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class BirthDate extends StatefulWidget {
  const BirthDate({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<BirthDate> createState() => _BirthDateState();
}

class _BirthDateState extends State<BirthDate> with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2023, 6, 29)); // TODO Now or actual Day???
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
      height: 70,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextButton(
          onPressed: () {
            _restorableDatePickerRouteFuture.present();
          },
          child: const Text('Pick your Birthday *'),
        ),
      ),
    );
  }
}
