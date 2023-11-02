import 'package:flutter/material.dart';

Widget iconAppbar({required BuildContext context, required Widget widget,required Color bkground , required VoidCallback callback, double? width, double? height}){
  return InkWell(
    onTap:callback ,
    child: Container(
      width:width ,
      height: height,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bkground,
        borderRadius: BorderRadius.circular(7)
      ),
      child:widget ,
    ),
  );
}