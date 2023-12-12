import 'package:flutter/material.dart';
import 'package:flutter_practis/day75/view/home_screen.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}