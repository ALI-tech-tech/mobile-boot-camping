import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Future.delayed(Duration(seconds: 5),(){
//   Navigator.pushReplacementNamed(context, "/home");
// });
    return Scaffold(

      body: Center(child: Image.asset("assets/images/logo.jpg"),),);
  }


}
