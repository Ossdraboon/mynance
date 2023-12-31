import 'package:MyNance/Providers/balanceEntryProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Model/MoneySectionConfiguration.dart';
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
                          MoneySectionConfiguration(3,"YEARLY FIX COST","manage your yearly Costs here",
                              CategoryConfiguration(paymentListYearlyManage),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,-1),
                            HistoryBoxConfiguration(BalanceType.payment),
                          ),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration(4,"MONTHLY FIX COST","manage your monthly Cost here",
                              CategoryConfiguration(paymentListMonthlyManage),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,-1),
                            HistoryBoxConfiguration(BalanceType.payment),
                          ),),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration(5,"YEARLY INCOME","manage your yearly Income here",
                              CategoryConfiguration(incomeListMonthlyManage),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(BalanceType.income),
                          ),),
                        ],
                      ),Column(
                        children: [
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration(6,"MONTHLY INCOME","manage your monthly Income here",
                              CategoryConfiguration(incomeListYearlyManage),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(BalanceType.income),
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
                margin: const EdgeInsetsDirectional.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 100),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration(3,"YEARLY FIX COST","manage your yearly Costs here",
                              CategoryConfiguration(paymentListYearlyManage),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,-1),
                            HistoryBoxConfiguration(BalanceType.payment),
                          ),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration(4,"MONTHLY FIX COST","manage your monthly Cost here",
                              CategoryConfiguration(paymentListMonthlyManage),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,-1),
                            HistoryBoxConfiguration(BalanceType.payment),
                          ),),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration(5,"YEARLY INCOME","manage your yearly Income here",
                              CategoryConfiguration(incomeListMonthlyManage),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(BalanceType.income),
                          ),),
                        ],
                      ),Column(
                        children: [
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration(6,"MONTHLY INCOME","manage your monthly Income here",
                              CategoryConfiguration(incomeListYearlyManage),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(BalanceType.income),
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


