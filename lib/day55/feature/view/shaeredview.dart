// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_practis/day55/core/theme.dart';
import 'package:flutter_practis/day55/feature/view/home.dart';

class ShaeredScreen extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  ShaeredScreen({
    Key? key,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  State<ShaeredScreen> createState() => _ShaeredScreenState();
}

class _ShaeredScreenState extends State<ShaeredScreen>  {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  
 
  @override
  Widget build(BuildContext context) {
    get(context, widget.themeNotifier);
    return Scaffold(
      appBar: AppBar(
        title: Text("Shaered"),
      ),
      body: Form(child: 
      Column(
        children: [
          TextFormField(
            controller: name,
          ),
          TextFormField(
            controller: email,
          ), 
          ElevatedButton(onPressed: ()async{
            SharedPreferences sh= await SharedPreferences.getInstance();
            sh.setString("Username", name.text);
            sh.setString("email", email.text);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(themeNotifier: widget.themeNotifier),));
          }, child: Text("Start Journy"))
        ],
      )),
    );
  }
}

 get(BuildContext context, ThemeNotifier themeNotifier)async{
    SharedPreferences sh= await SharedPreferences.getInstance();
    if (sh.getString("Username")!=null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(themeNotifier:themeNotifier ),));

    }
    return  sh;
  }