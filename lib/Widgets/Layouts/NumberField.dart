import 'package:MyNance/Providers/balanceEntryProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Model/MoneySectionConfiguration.dart';
import '../../homePage.dart';


class Numberfield extends ConsumerWidget {

  late InputFieldConfiguration _inputFieldConfiguration;

  final TextEditingController _nrFieldController = TextEditingController();
  final FocusNode node = FocusNode();

  Numberfield({required InputFieldConfiguration inputFieldConfiguration, super.key}) {
    _inputFieldConfiguration = inputFieldConfiguration;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _nrFieldController.text = ref.watch(balanceEntryBuilderProvider).amount?.toString()??"";
    _nrFieldController.selection = TextSelection.fromPosition(TextPosition(offset: _nrFieldController.text.length));
    //_nrFieldController.selection = TextSelection.collapsed(offset: _nrFieldController.text.length-1);

    return TextFormField(
      //autofocus: true,
     // focusNode: node,
        controller: _nrFieldController,
        style: const TextStyle(color: Colors.white, fontSize: 25),
        keyboardType: TextInputType.number,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.allow(
        //       RegExp(r'^(?=\D*(?:\d\D*){1,12}$)(\d+(?:\.\d{0,2})?$)')),   //\b
        // ],
        decoration: InputDecoration(
          labelText: _inputFieldConfiguration.text,
          labelStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
          hintText: _inputFieldConfiguration.hint,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
          border: InputBorder.none,
          icon: Icon(_inputFieldConfiguration.icon, color: Colors.blueAccent,size: 30,),
        ),
         onFieldSubmitted: (str){
          double? value = double.tryParse(str);
            ref.read(balanceEntryBuilderProvider.notifier).setAmount(value);
           // node.unfocus();
          FocusScope.of(context).unfocus();
            print("Textfeld Betrag ist: $value");
         },
      );
  }
}