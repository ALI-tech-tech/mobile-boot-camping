import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:jobsfinder/routes/app_routes.dart';
import 'package:jobsfinder/core/theme/theme_helper.dart';

import 'helpers/db_helper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  
  await DBHelper.initDatabase();
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'jobsfinder',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.completecompanysignUpScreen,
      routes: AppRoutes.routes,
    );
  }
}
