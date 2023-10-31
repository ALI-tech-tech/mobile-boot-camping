import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/features/view/Home/Homescreen.dart';
import 'package:flutter_practis/TalkahApp/features/view/login/loginscreen.dart';

class AppRoutes {
    static const String loginScreen = '/login_screen';
    static const String homeScreen = '/home_screen';


  static Map<String, WidgetBuilder> routes = {
    loginScreen:(context) => LoginScreen(),
    homeScreen:(context) => HomeScreen(),
  };
}
