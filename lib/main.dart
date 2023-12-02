import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobsfinder/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobsfinder/core/theme/theme_helper.dart';

import 'helpers/db_helper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  
  await DBHelper.initDatabase();
  ThemeHelper().changeTheme('primary');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'jobsfinder',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
