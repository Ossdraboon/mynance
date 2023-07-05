import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ChartButton extends StatefulWidget {
  const ChartButton({super.key});

  @override
  State<ChartButton> createState() => _ChartButton();
}

class _ChartButton extends State<ChartButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.bar_chart,
            size: 80,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/info');
          },
        ),
        Text('INFO'),
      ],
    );
  }
}