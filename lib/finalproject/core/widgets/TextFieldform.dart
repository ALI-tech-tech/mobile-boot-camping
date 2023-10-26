// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFieldForm extends StatefulWidget {
  TextEditingController controller;
  bool? pass;
  String lable;
  TextFieldForm({
    Key? key,
    required this.controller,
    required this.lable,this.pass=false
  }) : super(key: key);

  @override
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  bool visabil=false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !visabil,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.pass==true?(IconButton(onPressed: (){
          visabil=!visabil;
          setState(() {
            
          });
        }, icon: visabil==true?Icon(Icons.visibility_sharp):Icon(Icons.visibility_off))):null,
        label: Text(widget.lable,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
