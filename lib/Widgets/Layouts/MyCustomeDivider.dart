
import 'package:flutter/material.dart';

class MyCostumeDivider extends StatefulWidget {
  late double _boxheigt;
  late double _contheigt;
  late double _startline;
  late double _endline;


   MyCostumeDivider({required double boxheight, required double contheight, required double startline, required double endline,
     super.key,
   }){
     _boxheigt = boxheight;
     _contheigt = contheight;
     _startline = startline;
     _endline = endline;
   }

  @override
  State<MyCostumeDivider> createState() => _MyCostumeDividerState();
}

class _MyCostumeDividerState extends State<MyCostumeDivider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget._boxheigt,
      child: Center(
        child: Container(
          height: widget._contheigt,
          margin: EdgeInsetsDirectional.only(start: widget._startline, end: widget._endline),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white,
                Colors.blue.withOpacity(0.9),
                Colors.lightBlue.withOpacity(0.8),
                Colors.blue.withOpacity(0.9),
                Colors.cyan.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(3)),
            border: Border.all(color: Colors.transparent, width: 1),
          ),
        ),
      ),
    );
  }
}