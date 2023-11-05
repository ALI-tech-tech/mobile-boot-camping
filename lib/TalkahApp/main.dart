import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/Theme.dart';
import 'package:flutter_practis/TalkahApp/features/view/login/loginscreen.dart';
import 'package:flutter_practis/TalkahApp/features/view/main/Appmainscreen.dart';
import 'package:flutter_practis/TalkahApp/features/view/splash_screen/splashscreen.dart';
import 'package:flutter_practis/TalkahApp/routes/app_routs.dart';

import 'features/view/account/account_screnn.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:AppTheme,
      title: 'Material App',
      home:LoginScreen(),
      routes: AppRoutes.routes,
    );
  }
}