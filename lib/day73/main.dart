import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/homeSc.dart';
import 'viewmodel/moviewmodel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoViewModel>(
      create: (ctx) => MoViewModel(),
      child: MaterialApp(
        title: 'Material App',
        home: HomeSc(),
      ),
    );
  }
}
