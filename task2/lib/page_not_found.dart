import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("404",style: TextStyle(color: Colors.blue,fontSize: 200,fontWeight: FontWeight.bold),),
          Text("Page Not Found", style: TextStyle(color: Colors.red ,fontSize: 40),),
        ],
      ),),
    );
  }

}