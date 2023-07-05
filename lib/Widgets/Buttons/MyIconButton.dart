import 'package:flutter/material.dart';


class MyIconButton extends StatefulWidget {
  late IconData _icon;
  late double _size;


  MyIconButton({required IconData icon,required double size, super.key}) {
    _icon = icon;
    _size = size;
  }

  @override
  State<MyIconButton> createState() => _MyIconButton();
}

class _MyIconButton extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget._icon,size:widget._size,),
      onPressed: () {
        print("Delete Item from List");
      },
    );
  }
}