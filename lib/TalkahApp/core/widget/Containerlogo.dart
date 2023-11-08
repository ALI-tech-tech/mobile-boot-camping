import 'package:flutter/material.dart';

Widget Containerlogo(Widget logo, double radius, double width,double height){
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
    ),
    child:logo ,
  );
}