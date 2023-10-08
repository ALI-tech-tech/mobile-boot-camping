import 'package:flutter/material.dart';

import 'day28/Todo/view/ViewTask.dart';
import 'day28/q1/exchange.dart';
import 'day28/q2/Text.dart';

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
      home: Textwidget(),
    );
  }
}
