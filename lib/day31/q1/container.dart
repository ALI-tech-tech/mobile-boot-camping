import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_practis/MyPackage/Extentios/MyString.dart';

class AnimMycontainer extends StatefulWidget {
  const AnimMycontainer({super.key});

  @override
  State<AnimMycontainer> createState() => _AnimMycontainerState();
}

class _AnimMycontainerState extends State<AnimMycontainer> {
  var generatedColor=12;
  double width=100;
  double height=100;
genColor(){
  return  Random().nextInt(Colors.primaries.length);
}
gensize(){
  return (Random().nextDouble()*(Random().nextInt(300))+100);
}

@override
void initState() {
  super.initState();
  // generatedColor=genColor();
  // width=gensize();
  // height=gensize();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              decoration: BoxDecoration(
                color:Colors.primaries[generatedColor] ,
                borderRadius: BorderRadius.circular(Random().nextDouble()*50),
      
              ),
              curve: Curves.easeInCubic,
              duration: Duration(seconds: 1),
              
              width: width,
              height: height,
              ),
              SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
              ElevatedButton(onPressed: (){
                generatedColor=genColor();
                setState(() {
                  
                });
              }, child: Text("color")),
              SizedBox(width: 5,),
               ElevatedButton(onPressed: (){
               width=gensize();
               height=gensize();
                setState(() {
                  
                });
              }, child: Text("size")),
            ],),
            ElevatedButton(onPressed: (){
              generatedColor=genColor();
               width=gensize();
               height=gensize();
                setState(() {
                  
                });
              }, child: Text("all")),
          ],
        ),
      ),
    );
  }
}