import 'package:flutter/material.dart';
import 'package:MyNance/Widgets/Layouts/Dropdown.dart';
import 'package:MyNance/Widgets/Buttons/SignUpButton.dart';
import 'package:MyNance/Widgets/Buttons/MyBackButton.dart';
import 'Widgets/Layouts/NumberFieldPhone.dart';
import 'Widgets/Layouts/TextField.dart';
import 'Widgets/Layouts/TextFieldEmail.dart';
import 'Widgets/Layouts/TextFieldPassword.dart';
import 'main.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var colorScheme = Theme.of(context).colorScheme;

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
                      const SizedBox(height: 30),
                      Textfield(hint: "Name", icon: Icons.person),
                      TextfieldPassword(
                          hint: "Password",
                          controller: passwordController,
                          icon: Icons.password),
                      TextfieldPassword(
                          hint: "Repeat Password",
                          controller: passwordController,
                          icon: Icons.password),
                      // TODO: P3, 23.07.04, Show password (toggle)
                      TextfieldEmail(
                        hint: "Email",
                        icon: Icons.alternate_email,
                        controller: emailController,
                      ),
                      // TODO: P3, 23.07.04, Regex for Emailvalidation
                      NumberfieldPhone(
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
              const CircularParticleScreen(),
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
                          NameSection(),
                          PasswordSection(passwordController: passwordController),
                          PasswordRepeatSection(passwordController: passwordController),
                          EmailSection(emailController: emailController),
                          PhoneNumberSection(),
                          const BirthdaySection(),
                          const GenderSection(),
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

class NameSection extends StatelessWidget {
  const NameSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Textfield(hint: "Name", icon: Icons.person),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20,
            alignment: Alignment.topRight,
            child: const Text(
              "mandatory",
              style: TextStyle(color: Colors.blueAccent),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordSection extends StatelessWidget {
  const PasswordSection({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextfieldPassword(
            hint: "Password",
            controller: passwordController,
            icon: Icons.password),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20,
            alignment: Alignment.topRight,
            child: const Text(
              "mandatory",
              style: TextStyle(color: Colors.blueAccent),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordRepeatSection extends StatelessWidget {
  const PasswordRepeatSection({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextfieldPassword(
            hint: "Repeat Password",
            controller: passwordController,
            icon: Icons.password),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20,
            alignment: Alignment.topRight,
            child: const Text(
              "mandatory",
              style: TextStyle(color: Colors.blueAccent),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}

class EmailSection extends StatelessWidget {
  const EmailSection({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextfieldEmail(
            hint: "Email",
            controller: emailController,
            icon: Icons.alternate_email),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20,
            alignment: Alignment.topRight,
            child: const Text(
              "mandatory",
              style: TextStyle(color: Colors.blueAccent),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}

class PhoneNumberSection extends StatelessWidget {
  const PhoneNumberSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NumberfieldPhone(
            hint: "Phone Number",
            icon: Icons.phone_android_outlined),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20,
            alignment: Alignment.topRight,
            child: const Text(
              "optional",
              style: TextStyle(color: Colors.blueAccent),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}

class GenderSection extends StatelessWidget {
  const GenderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
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
          // color: const Color.fromRGBO(
          //     15, 165, 210, 0.9),
          border: Border.all(
            color: const Color.fromRGBO(21, 80, 199, 0.3),
            width: 0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.transgender, color: Colors.blueAccent),
                SizedBox(width: 5),
                GenderPick(),
              ],
            ),
            Container(
              height: 70,
              alignment: Alignment.topRight,
              child: const Text(
                "optional",
                style: TextStyle(color: Colors.blueAccent),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 200,
        child: DropdownButton<String>(
          iconSize: 0.0,
          value: dropdownValue,
          isExpanded: true,
          underline: Container(),
          dropdownColor: Colors.transparent,
          elevation: 0,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
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
              child: SizedBox(
                child: Container(
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
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset:
                              const Offset(2, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(value)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BirthdaySection extends StatelessWidget {
  const BirthdaySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
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
          // color: const Color.fromRGBO(
          //     15, 165, 210, 0.9),
          border: Border.all(
            color: const Color.fromRGBO(21, 80, 199, 0.3),
            width: 0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Colors.blueAccent,
                ),
                BirthDate(),
              ],
            ),
            Container(
              alignment: Alignment.topRight,
              child: const Text(
                "optional",
                style: TextStyle(color: Colors.blueAccent),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
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

class _BirthDateState extends State<BirthDate> with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        width: 200,
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
          // color: const Color.fromRGBO(
          //     15, 165, 210, 0.9),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            // color: const Color.fromRGBO(21, 80, 199, 0.3),
            width: 0,
          ),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.7),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                _restorableDatePickerRouteFuture.present();
              },
              child: const Text(
                'Pick your Birthday',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
