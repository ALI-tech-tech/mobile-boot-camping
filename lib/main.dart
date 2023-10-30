import 'package:flutter/material.dart';
import 'package:flutter_practis/day29/q2/picture1/news.dart';
import 'package:flutter_practis/day30/q1/form.dart';
import 'package:flutter_practis/day31/homework/movieapp/pages/paage8.dart';
import 'package:flutter_practis/day31/homework/movieapp/pages/page14.dart';
import 'package:flutter_practis/day35/pizzaorder/Pizzaview.dart';
import 'package:flutter_practis/day36/view/CoursesView.dart';
import 'package:flutter_practis/day37/view/GbaHome.dart';


import 'day28/Todo/view/ViewTask.dart';
import 'day28/q1/exchange.dart';
import 'day28/q2/Text.dart';
import 'day29/q1/search.dart';
import 'day30/q2/subinfo.dart';
import 'day31/homework/movieapp/pages/page16.dart';
import 'day31/homework/movieapp/pages/page17.dart';
import 'day31/q1/container.dart';
import 'day31/q2/tween.dart';
import 'day33/ProductView.dart';
import 'day34/animcontainer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GbaCalocltor(),
      
    );
  }
}
