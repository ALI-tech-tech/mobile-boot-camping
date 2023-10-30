import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/features/view/login/loginscreen.dart';

class AppRoutes {
    static const String loginScreen = '/login_screen';


  static Map<String, WidgetBuilder> routes = {
    loginScreen:(context) => LoginScreen(),
  };
}
