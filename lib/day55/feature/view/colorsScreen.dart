// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/day55/core/theme.dart';
import 'package:flutter_practis/day55/feature/widget/Colorselected.dart';

class ColorsScreen extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  ColorsScreen({
    Key? key,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
 

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: 
      Center(
        child: ColorSelectionWidget(themeNotifier: widget.themeNotifier)
        
        
  
    ));  }

    
}