import 'package:blogappwithrealapi/core/view/home_screen.dart';
import 'package:blogappwithrealapi/core/viewmodel/artical_viewmodel.dart';
import 'package:blogappwithrealapi/core/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ArticalViewModel(),),
        ChangeNotifierProvider(create: (context) => UserViewModel(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.home,
        home: HomeScreen(),
      ),
    );
  }
}
