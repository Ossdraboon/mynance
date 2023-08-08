import 'package:MyNance/Model/ChartSectionConfiguration.dart';
import 'package:MyNance/Widgets/historyList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'Model/MoneySectionConfiguration.dart';
import 'Widgets/Layouts/InfoElement.dart';
import 'Widgets/Layouts/HistoryBox.dart';
import 'Widgets/Layouts/MoneyElements.dart';
import 'main.dart';
import 'package:MyNance/Widgets/Layouts/Dropdown.dart';
import 'package:MyNance/Widgets/Buttons/QuickMoney.dart';
import 'Widgets/Layouts/BarChart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'homePage.g.dart';


const _uuid = Uuid();


@immutable
class Entry {
  const Entry({
    required this.categories,
    required this.amount,
    required this.id,

  });
  final String categories;
  final double amount;
  final String id;


  @override
  String toString() {
    return 'Entry(ID: $id,Category: $categories, Value: $amount)';
  }
}

/// An object that controls a list of [Entry].
class EntryList extends StateNotifier<List<Entry>> {
  EntryList([List<Entry>? historyitems]) : super(historyitems ?? []);

  void add(String categories, double amount) {
    state = [
      ...state,
      Entry(
        id: _uuid.v4(),
        amount: amount,
        categories: categories,
      ),
    ];
  }

  void remove(Entry target) {
    state = state.where((entry) => entry.id != target.id).toList();
  }
}

@JsonSerializable()
class DataBankMoney {
  String categories;
  double value;
  DateTime created = DateTime.now();

  DataBankMoney({required this.categories, required this.value});

  factory DataBankMoney.fromJson(Map<String, dynamic> json) => _$DataBankMoneyFromJson(json);
  Map<String, dynamic> toJson() => _$DataBankMoneyToJson(this);
}

@JsonSerializable()
class DataInputs {
  String userText;
  double userNumber;

  List<DataBankMoney> inputlist = List<DataBankMoney>.empty(growable: true);

  DataInputs({required this.userText,
    required this.userNumber,
    });

  factory DataInputs.fromJson(Map<String, dynamic> json) =>
      _$DataInputsFromJson(json);

  Map<String, dynamic> toJson() => _$DataInputsToJson(this);
}


// class ValueListener extends ConsumerWidget {
//   const ValueListener({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     Testobject value = ref.watch(testobjectbuilderProvider);
//
//     if(value.amount != null) {
//       ref.read(testListProvider.notifier).add(value);
//     }
//
//     return const SizedBox(width: 0, height: 0,);
//   }
// }

// class MagicTitleListener extends ConsumerWidget {
//   const MagicTitleListener({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Text("${ref.watch(testobjectbuilderProvider).amount?.toString()??""} _ ${ref.watch(testobjectbuilderProvider).categories}"); }
// }



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
                      //const ValueListener(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration("PAYMENT","manage your daily Payments here",
                              CategoryConfiguration(paymentList),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,-1),
                            HistoryBoxConfiguration(true),
                          ),),
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration("INCOME","manage your daily Income here",
                              CategoryConfiguration(incomeList),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(true),
                          ),),
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration("GOAL","set your Goal here",
                              CategoryConfiguration(goalList),
                              InputFieldConfiguration("individually Goal","add Gaol",Icons.savings_outlined),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(true),
                          ),),
                          const SizedBox(height: 20),
                        ],
                      ),
                      // InfoSection(),
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
                height: MediaQuery.of(context).size.height,
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
                height: MediaQuery.of(context).size.height,
                // alignment: Alignment.center,
                margin: const EdgeInsetsDirectional.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //MagicTitleListener(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 180),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration("PAYMENT","manage your daily Payments here",
                              CategoryConfiguration(paymentList),
                              InputFieldConfiguration("individually Payment","add Payment",Icons.remove),
                              QuickValueConfiguration(quickmoneyList,1),
                              HistoryBoxConfiguration(false),
                          ),),
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration("INCOME","manage your daily Income here",
                              CategoryConfiguration(incomeList),
                              InputFieldConfiguration("individually Income","add Income",Icons.add),
                              QuickValueConfiguration(quickmoneyList,1),
                              HistoryBoxConfiguration(true),
                          ),),
                          const SizedBox(height: 20),
                          MoneySectionBuilder(sectionConfiguration:
                          MoneySectionConfiguration("GOAL","set your Goal here",
                              CategoryConfiguration(goalList),
                              InputFieldConfiguration("individually Goal","add Gaol",Icons.savings_outlined),
                              QuickValueConfiguration(quickmoneyList,1),
                            HistoryBoxConfiguration(true),
                          ),),
                          const SizedBox(height: 20),
                        ],
                      ),
                      InfoSectionBuilder(chartSectionConfiguration:
                      ChartSectionConfiguration(
                        LineChartConfiguration(weeklyCost),
                        BarChartConfiguration(weekDays,fakedataList)
                      ),

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




class MoneySectionBuilder extends StatefulWidget {
 late MoneySectionConfiguration _sectionConfiguration;

   MoneySectionBuilder({
    super.key,required MoneySectionConfiguration sectionConfiguration
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
                HistoryList(widget._sectionConfiguration.historyBoxConfiguration)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


