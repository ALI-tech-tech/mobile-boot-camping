// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_practis/day55/core/color.dart';
import 'package:flutter_practis/day55/core/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_practis/day55/feature/view/shaeredview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}
final ThemeNotifier themeNotifier = ThemeNotifier();
class MyApp extends StatefulWidget {
  


  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     themeNotifier.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    //setcolo();
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
          colorSchemeSeed: themeNotifier.selectedColor,
          appBarTheme: AppBarTheme()),
      home: ShaeredScreen(themeNotifier: themeNotifier),
    );
  }
}
