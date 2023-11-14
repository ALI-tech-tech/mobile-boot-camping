import 'package:flutter/material.dart';
import 'package:flutter_practis/day54/core/view/Actors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ActorsView(),
    );
  }
}