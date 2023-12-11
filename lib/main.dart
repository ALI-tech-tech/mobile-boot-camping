import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/core/viewmodel/memberviewmodel.dart';
import 'package:taskmanager/core/viewmodel/taskviewmodel.dart';

import 'core/view/homeScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(ctx)=> MemberViewModel()), 
        ChangeNotifierProvider(create: (ctx)=> TaskViewModel()), 

      ],
      child: MatApp(),
    );
  }
}

class MatApp extends StatelessWidget {
  const MatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:HomeScreen(),
    );
  }
}
