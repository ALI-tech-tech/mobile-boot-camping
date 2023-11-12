import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  late String label;
  late Color color;
  CustomTextField({super.key,required this.label,required this.color});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: widget.color),
      child: TextField(textAlign: TextAlign.start,decoration: InputDecoration(focusColor: Colors.white,fillColor: Colors.white,hintText: widget.label,hintStyle: TextStyle(color: Color(0xffd656e7e).withOpacity(0.5)),border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),),style: TextStyle(color: Color(0xffd484e5a)),),
    );
  }
}
