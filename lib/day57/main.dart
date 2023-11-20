import 'package:flutter/material.dart';
import 'package:flutter_practis/day57/db_helper.dart';
import 'package:flutter_practis/day57/entites/student.dart';
import 'package:flutter_practis/day57/home.dart';
import 'package:flutter_practis/day57/routes/app_routs.dart';
import 'package:flutter_practis/day57/view/widgets/mydrawer.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          foregroundColor: Colors.teal,
        )),
        appBarTheme: AppBarTheme(
          
          backgroundColor: Colors.teal.withOpacity(0.7), 
          foregroundColor: Colors.white.withOpacity(0.9)
        ),
        useMaterial3: true,
      ),
      routes:AppRoutes.routes ,
      home: HomeScreen(),
   
    );
  }
}
