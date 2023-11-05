import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/app_colors.dart';

ThemeData AppTheme=ThemeData(
  scaffoldBackgroundColor: App_Color.bkgroundapp,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    
    backgroundColor: App_Color.Primary,
    foregroundColor: App_Color.AppbarTextheader,
    iconTheme: IconThemeData(
      color: App_Color.AppbarTextheader,
    )
    
  ),
textTheme: TextTheme(
  
)
);