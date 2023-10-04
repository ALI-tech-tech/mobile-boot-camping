import 'package:day26/q1.dart';
import 'package:day26/q2.dart';
import 'package:flutter/material.dart';

import 'q3/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home()
      
      // Scaffold(
      //   appBar: AppBar(
      //     title: Text("Material App Bar"),
      //   ),
      // body:  q1(),)

    );
  }
}
