import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFildForm extends StatelessWidget {
  String? hint="";
  
  TextInputType? type=TextInputType.none;
  TextEditingController controller;
  FilteringTextInputFormatter? filter;
  TextFildForm({super.key, required this.controller,this.filter,this.hint,this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:(v){
        if (!v!.isEmpty) {
          return null;
        }
      } ,
      textCapitalization: TextCapitalization.words,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      inputFormatters: [
        if (filter!=null) 
        filter!
      ],
      keyboardType: type,
      decoration: InputDecoration(
        label:Text(hint??'') ,
          hintText: hint??"",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
