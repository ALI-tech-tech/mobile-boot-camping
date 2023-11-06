import 'package:flutter/material.dart';
import 'package:flutter_practis/day49/features/View/categorylist.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      title: 'Material App',
      home: CategoryList(),
    );
  }
}