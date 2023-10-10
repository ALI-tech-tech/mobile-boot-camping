import 'package:flutter/material.dart';
import 'package:flutter_practis/day29/q2/picture1/news.dart';
import 'package:flutter_practis/day30/q1/form.dart';

import 'day28/Todo/view/ViewTask.dart';
import 'day28/q1/exchange.dart';
import 'day28/q2/Text.dart';
import 'day29/q1/search.dart';
import 'day30/q2/subinfo.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Formvalid(),
    );
  }
}
