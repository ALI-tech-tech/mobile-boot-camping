import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/day55/core/theme.dart';
import 'package:flutter_practis/day55/feature/view/colorsScreen.dart';
import 'package:flutter_practis/day55/feature/view/shaeredview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
    final ThemeNotifier themeNotifier;
   HomeScreen({super.key, required this.themeNotifier});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name="";
  String pssword="";
  Color? color;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color=widget.themeNotifier.selectedColor;
  }
  @override
  Widget build(BuildContext context) {
    getcolor();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ColorsScreen(themeNotifier: widget.themeNotifier,);
            },));
          }, icon: Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(name),
            Text(pssword),
            Text("0"),
            Container(
              width: 30, 
              height: 30,
              color:color ,
            )
          ],
        ),
      ),
    );
  }

  getcolor()async{
    //await Future.delayed(Duration(seconds: 3));
    SharedPreferences sh=await SharedPreferences.getInstance();
    name= sh.getString("Username")??"";
    pssword = sh.getString("email")??"";
    // int c=sh.getInt("color")!;
    // color=Color(c) ;
    setState(() {
      
    });
    //return sh.getString("color") as Color; 
  }
}