import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Model/SectionConfiguration.dart';
import 'Widgets/Buttons/MyTextButtonAnalytics.dart';
import 'Widgets/Layouts/InfoElement.dart';
import 'Widgets/Layouts/HistoryBox.dart';
import 'Widgets/Layouts/MoneyElements.dart';
import 'main.dart';
import 'package:MyNance/Widgets/Layouts/Dropdown.dart';

import 'package:MyNance/Widgets/Buttons/QuickMoney.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

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
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("PAYMENT","manage your daily Payments here",
                              CategoryConfiguration(paymentList),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,-1),
                            HistoryBoxConfiguration(historyList),
                          ),),
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("INCOME","manage your daily Income here",
                              CategoryConfiguration(incomeList),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(historyList),
                          ),),
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("GOAL","set your Goal here",
                              CategoryConfiguration(goalList),
                              InputFieldConfiguration("individually Goal","add Gaol",Icons.savings_outlined),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(historyList),
                          ),),
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
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("PAYMENT","manage your daily Payments here",
                              CategoryConfiguration(paymentList),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,-1),
                              HistoryBoxConfiguration(historyList),
                          ),),
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("INCOME","manage your daily Income here",
                              CategoryConfiguration(incomeList),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                              HistoryBoxConfiguration(historyList),
                          ),),
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("GOAL","set your Goal here",
                              CategoryConfiguration(goalList),
                              InputFieldConfiguration("individually Goal","add Gaol",Icons.savings_outlined),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(historyList),
                          ),),
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





class MoneySectionBuilder extends StatefulWidget {
 late SectionConfiguration _sectionConfiguration;



   MoneySectionBuilder({
    super.key,required SectionConfiguration sectionConfiguration
  }){
     _sectionConfiguration = sectionConfiguration;
   }



  @override
  State<MoneySectionBuilder> createState() => _MoneySectionBuilderState();
}

class _MoneySectionBuilderState extends State<MoneySectionBuilder> {
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
              title:  Text(widget._sectionConfiguration.title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle:  Text(
                widget._sectionConfiguration.subtitle,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                MoneySection(categoryConfiguration: widget._sectionConfiguration.categoryConfiguration, inputFieldConfiguration: widget._sectionConfiguration.inputFieldConfiguration),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget._sectionConfiguration.quickValueConfiguration.values
                        .map((element) => QuickMoney(
                      text: (widget._sectionConfiguration.quickValueConfiguration.signe * element).toString(),
                    ))
                        .toList()
                ),
                const SizedBox(height: 20),
                const Text("History List",style: TextStyle(color: Colors.white,fontSize: 20)),
                const SizedBox(height: 10),
                 Container(
                   height: 200,
                   child: SingleChildScrollView(
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: widget._sectionConfiguration.historyBoxConfiguration.values
                          .map((element) => HistoryBox(
                        text: element.toString(),
                      ))
                          .toList()),
                   ),
                 ),
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
      child:  const Column(
        children: [
          PieChartSample2(),
          MyTextButtonAnalytics(),
        ],
      ),
    );
  }












}
