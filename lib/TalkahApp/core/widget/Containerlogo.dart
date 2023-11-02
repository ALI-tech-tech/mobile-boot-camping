import 'package:flutter/material.dart';

Widget Containerlogo(Widget logo){
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child:logo ,
  );
}