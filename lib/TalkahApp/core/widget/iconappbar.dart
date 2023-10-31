import 'package:flutter/material.dart';

Widget iconAppbar(BuildContext context, Widget widget){
  return Container(
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.3),
      borderRadius: BorderRadius.circular(7)
    ),
    child:widget ,
  );
}