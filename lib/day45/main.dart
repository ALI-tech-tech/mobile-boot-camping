import 'package:flutter/material.dart';

import 'view/todoView.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
        useMaterial3: true
      ),
      home: TodoView(),
    );
  }
}