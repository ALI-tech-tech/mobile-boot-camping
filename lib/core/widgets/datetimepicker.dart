import 'package:flutter/material.dart';

import '../theme/theme_helper.dart';

class DatePic {
  
  static dateTimePickerWidget(BuildContext context) async {
    
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData().copyWith(
          
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(theme.colorScheme.primary), // Change button text color
              // overlayColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.2))
              )),
          primaryColor: theme.colorScheme.primary,
          datePickerTheme: DatePickerThemeData(
            headerBackgroundColor: theme.colorScheme.primary,
            todayBackgroundColor: MaterialStatePropertyAll(theme.colorScheme.primary),
            
          )
        ),
        
        child: child!,
      );
    },
    );

    if (picked != null ) {
      return picked;
    }
  }

}