import 'package:flutter/material.dart';

Widget bksvg(Widget widget, double width, double height,double circular ){
  return Container(
    padding: EdgeInsets.all(5),
    width: width, 
    height: height, 
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(circular)
    ),
    child:widget ,
  );
}