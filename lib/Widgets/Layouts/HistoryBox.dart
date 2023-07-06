import 'package:flutter/material.dart';
import '../Buttons/MyIconButton.dart';



class HistoryBox extends StatefulWidget {
  late String _text;

  HistoryBox({required String text, super.key}) {
    _text = text;
  }

  @override
  State<HistoryBox> createState() => _HistoryBox();
}

class _HistoryBox extends State<HistoryBox> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
              width: 0,
              color: Colors.white.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            const Icon(Icons.delete_forever,color: Colors.blueAccent,),
            SizedBox(width: 30),
            Text("Categories", style: TextStyle(color: Colors.white),),
            const SizedBox(width: 50),
            Text(widget._text, style: TextStyle(color: Colors.white),),
          ],
        ),
      );
  }
}



