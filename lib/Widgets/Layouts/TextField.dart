import 'package:MyNance/Providers/accountCreateProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class Textfield extends ConsumerWidget {
  late String _hint;
  late IconData _icon;

  final TextEditingController _nameFieldController = TextEditingController();
  final FocusNode node = FocusNode();

  Textfield({required String hint, required IconData icon, super.key}) {
    _hint = hint;
    _icon = icon;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _nameFieldController.text = ref.watch(accountCreateBuilderProvider).name;
    _nameFieldController.selection = TextSelection.fromPosition(TextPosition(offset: _nameFieldController.text.length));
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
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

        child: TextFormField(
          controller: _nameFieldController,
          style: const TextStyle(color: Colors.white, fontSize: 25),
          keyboardType: TextInputType.text,
          decoration:
          InputDecoration(
            border: InputBorder.none,
              labelText: _hint,
              labelStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
              iconColor: Colors.blueAccent,
              icon: Icon(_icon),
              hintText: _hint,
            hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          // onFieldSubmitted: (str) {
          //
          //   ref
          //       .read(accountCreateBuilderProvider.notifier)
          //       .setName();
          //   // node.unfocus();
          //   FocusScope.of(context).unfocus();
          // },
        ),
      ),
    );
  }
}