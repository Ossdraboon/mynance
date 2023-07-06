import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Model/SectionConfiguration.dart';
import 'Widgets/Buttons/SaveButton.dart';
import 'Widgets/Layouts/HistoryBox.dart';
import 'Widgets/Layouts/MoneyElements.dart';
import 'homePage.dart';
import 'main.dart';
import 'package:MyNance/Widgets/Layouts/Dropdown.dart';


class ManageAccount extends StatelessWidget {
  const ManageAccount({super.key});

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
                          SectionConfiguration("YEARLY FIX COST","manage your yearly Costs here",
                              CategoryConfiguration(paymentListYearlyManage),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,-1),
                            HistoryBoxConfiguration(historyList),
                          ),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("MONTHLY FIX COST","manage your monthly Cost here",
                              CategoryConfiguration(paymentListMonthlyManage),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,-1),
                            HistoryBoxConfiguration(historyList),
                          ),),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("YEARLY INCOME","manage your yearly Income here",
                              CategoryConfiguration(incomeListMonthlyManage),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(historyList),
                          ),),
                        ],
                      ),Column(
                        children: [
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("MONTHLY INCOME","manage your monthly Income here",
                              CategoryConfiguration(incomeListYearlyManage),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(historyList),
                          ),),
                          const SizedBox(height: 20),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("YEARLY FIX COST","manage your yearly Costs here",
                              CategoryConfiguration(paymentListYearlyManage),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,-1),
                            HistoryBoxConfiguration(historyList),
                          ),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("MONTHLY FIX COST","manage your monthly Cost here",
                              CategoryConfiguration(paymentListMonthlyManage),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,-1),
                            HistoryBoxConfiguration(historyList),
                          ),),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("YEARLY INCOME","manage your yearly Income here",
                              CategoryConfiguration(incomeListMonthlyManage),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(historyList),
                          ),),
                        ],
                      ),Column(
                        children: [
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          SectionConfiguration("MONTHLY INCOME","manage your monthly Income here",
                              CategoryConfiguration(incomeListYearlyManage),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(historyList),
                          ),),
                          const SizedBox(height: 20),
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


