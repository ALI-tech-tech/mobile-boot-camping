// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  Color _selectedColor = Colors.blue;
  ThemeNotifier(){
    loadColor();
  }

  Color get selectedColor => _selectedColor;

   updateColor(Color color) async {
    _selectedColor = color;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Color', color.value);
  }

  void loadColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? colorValue = prefs.getInt('Color');
    if (colorValue != null) {
      _selectedColor = Color(colorValue);
      notifyListeners();
    }
  }
}
