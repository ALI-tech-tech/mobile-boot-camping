import 'package:flutter/material.dart';

Widget blockcontainer(Widget? leading,Widget? title,Widget? subtitle,Widget? trailing,double width, double height ,double circular, VoidCallback callback){
  return InkWell(
    onTap: callback,
    child: Container(
      margin: EdgeInsets.all(8),
      width:width ,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(circular)
      ),
      child: ListTile(
        leading:leading ,
        title:title ,
        subtitle: subtitle,
        trailing: trailing,
      ),
  
    ),
  );
}