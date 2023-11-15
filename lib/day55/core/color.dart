
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyColor extends ChangeNotifier {
  static late Color color;

MyColor(){
  getcolor();
}
  SharedPreferences? sh;
   Future<Color> getcolor()async{
    sh=await SharedPreferences.getInstance();
    color=Color(sh!.getInt("color")!)??setColor(Colors.purple) ;
    notifyListeners();
    return color;
  }
  setColor(Color co)async{
   sh=await SharedPreferences.getInstance();
   
    sh!.setInt("color", co.value) ;
    notifyListeners();
  }
  
  }