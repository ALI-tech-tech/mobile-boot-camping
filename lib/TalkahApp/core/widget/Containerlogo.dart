import 'package:flutter/material.dart';

Widget Containerlogo(Widget logo){
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 60,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child:logo ,
  );
}