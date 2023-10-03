import 'package:day23/home_page.dart';
import 'package:flutter/material.dart';

import 'Studentapp.dart';
import 'calcolate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Studentapp(),
    );
  }
}



