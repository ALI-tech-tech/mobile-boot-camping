import 'package:flutter/material.dart';

 class myinputdecoration extends InputDecoration {
  
  static InputDecoration deco(){
    return InputDecoration(
                  hintText: "Task Title ..",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  )
                );
  }
}