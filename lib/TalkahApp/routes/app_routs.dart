import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/features/view/Home/Homescreen.dart';
import 'package:flutter_practis/TalkahApp/features/view/account/account_screnn.dart';
import 'package:flutter_practis/TalkahApp/features/view/login/loginscreen.dart';
import 'package:flutter_practis/TalkahApp/features/view/main/Appmainscreen.dart';
import 'package:flutter_practis/TalkahApp/features/view/notification/notificationscreen.dart';
import 'package:flutter_practis/TalkahApp/features/view/otp/otpscreen.dart';

class AppRoutes {
    static const String loginScreen = '/login_screen';
    static const String homeScreen = '/home_screen';
    static const String notificationScreen = '/notification_screen';
    static const String accountscreen = '/account_screen';
    static const String appmainscreen = '/appmain_screen';
    static const String otpscreen = '/otp_screen';
    


  static Map<String, WidgetBuilder> routes = {
    loginScreen:(context) => LoginScreen(),
   // homeScreen:(context) => HomeScreen(),
    notificationScreen:(context) => NotificationScreen(),
    accountscreen:(context) => AccountScreen(),
    appmainscreen:(context) => AppMainPage(),
    otpscreen:(context) => OTPScreen(),
  };
}
