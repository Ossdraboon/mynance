import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widgets/Buttons/MyTextButtonAnalytics.dart';
import 'main.dart';
import 'package:MyNance/Widgets/layoutElements.dart';
import 'package:MyNance/Widgets/layoutButtons.dart';
import 'package:MyNance/Widgets/Buttons/QuickMoney.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var values = [5, 10, 20, 50];

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
                height: double.infinity,
                // alignment: Alignment.center,
                margin: const EdgeInsetsDirectional.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          TopPaymentSection(values: values),
                          const SizedBox(height: 20),
                          TopIncomeSection(values: values),
                          const SizedBox(height: 20),
                          TopGoalSection(values: values),
                          const SizedBox(height: 20),
                        ],
                      ),
                      const TopInfoSection(),
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
                height: double.infinity,
                // alignment: Alignment.center,
                margin: const EdgeInsetsDirectional.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 170),
                          TopPaymentSection(values: values),
                          const SizedBox(height: 20),
                          TopIncomeSection(values: values),
                          const SizedBox(height: 20),
                          TopGoalSection(values: values),
                          const SizedBox(height: 20),
                        ],
                      ),
                      const TopInfoSection(),
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


class TopGoalSection extends StatelessWidget {
  const TopGoalSection({
    super.key,
    required this.values,
  });

  final List<int> values;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: const Text(
              'Add New Payment here...',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: const Text(
              'Manage your Daily Payments',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            //subtitle: Text('do i need that?'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              const GoalSection(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: values
                      .map((element) => QuickMoney(
                            text: (1 * element).toString(),
                          ))
                      .toList()),
            ],
          ),
        ],
      ),
    );
  }
}

class TopIncomeSection extends StatelessWidget {
  const TopIncomeSection({
    super.key,
    required this.values,
  });

  final List<int> values;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: const Text(
              'Add New Payment here...',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: const Text(
              'Manage your Daily Payments',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            //subtitle: Text('do i need that?'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              const IncomeSection(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: values
                      .map((element) => QuickMoney(
                            text: (1 * element).toString(),
                          ))
                      .toList()),
            ],
          ),
        ],
      ),
    );
  }
}

class TopPaymentSection extends StatelessWidget {
  const TopPaymentSection({
    super.key,
    required this.values,
  });

  final List<int> values;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              // shape: Border(),
              //trailing: Icon(Icons.money, color: Colors.white,),
              title: const Text(
                'Add New Payment here...',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: const Text(
                'Manage your Daily Payments',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                const PaymentSection(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: values
                        .map((element) => QuickMoney(
                              text: (-1 * element).toString(),
                            ))
                        .toList()),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopInfoSection extends StatelessWidget {
  const TopInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      //child: InfoSection(),
      child: const Column(
        children: [
          PieChartSample2(),
          MyTextButtonAnalytics(),
        ],
      ),
    );
  }
}
