import 'package:flutter/material.dart';
import '../Buttons/MyIconButton.dart';


class ListItem extends StatefulWidget {
  late double _history;

   ListItem({required double history,
    super.key,
  })
   {
     _history = history;
   }

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              MyIconButton(icon: Icons.delete_forever, size: 20),
              const SizedBox(
                width: 10,
              ),
               Text("€${widget._history}"),
            ],
          ),
        ),
        const Divider(
          height: 2,
          thickness: 1,
          indent: 5,
          endIndent: 5,
          color: Colors.black,
        ),
      ],
    );
  }
}

class HistoryBox extends StatelessWidget {
  const HistoryBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 0,
            color: Colors.white.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 200,
      width: 600,
      child:   SingleChildScrollView(
        child: Column(
          children: [
            ListItem(history: 200),
            ListItem(history: 302.30,),
            ListItem(history: 10.99,),
            ListItem(history: 344.30,),
            ListItem(history: 123.43,),
            ListItem(history: 409.9,),
          ],
        ),
      ),
    );
  }
}