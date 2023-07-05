import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:MyNance/Widgets/Buttons/ChartButton.dart';



//Info
class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 3.0, color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 150,
            child: const Center(
              child: ChartButton(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 3.0, color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 150,
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  Text("Test text for show of Day Information and Analytics"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Test text for show of Weekly Information and Analytics"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Test text for show of Monthly Information and Analytics"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Test text for show of Yearly Information and Analytics"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Test text for show of Overall Information and Analytics"),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}



class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 3,
                  centerSpaceRadius: 30,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: Colors.deepOrange,
                text: 'Fixed Costs',
                isSquare: false,
              ),
              SizedBox(
                height: 20,
              ),
              Indicator(
                color: Colors.amber,
                text: 'Current Monthly Cost',
                isSquare: true,
              ),
              SizedBox(
                height: 20,
              ),
              Indicator(
                color: Colors.purple,
                text: 'Average Expenditure',
                isSquare: true,
              ),
              SizedBox(
                height: 20,
              ),
              Indicator(
                color: Colors.green,
                text: 'Remaining Volume',
                isSquare: true,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.deepOrange,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.amber,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });

  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}
//
