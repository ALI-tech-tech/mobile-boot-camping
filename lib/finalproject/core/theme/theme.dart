
import 'package:flutter/material.dart';

ThemeData dark=ThemeData(
  brightness: Brightness.dark,
  
  scaffoldBackgroundColor: Colors.black38,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.amber,
      minimumSize: Size(300, 50),
    )
  ),
  iconTheme: IconThemeData(
    color: Colors.amber
  ),
  radioTheme: RadioThemeData(
    
    fillColor: MaterialStatePropertyAll(Colors.amber))
  //textTheme: TextTheme(titleLarge: TextStyle(color: Colors.white),bodyMedium: TextStyle(color: Colors.white))
);