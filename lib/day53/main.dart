import 'package:flutter/material.dart';
import 'package:flutter_practis/day53/feature/view/sqflitecrud.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
        )
      ),
      home: SqfliteDRUD(),
    );
  }
}