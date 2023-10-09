
import 'package:flutter/material.dart';

import 'myrow.dart';

class calculate extends StatelessWidget {
  const calculate({super.key});
  
  @override
  Widget build(BuildContext context) {
    int cirdclwidth=70;
    int circlwidth=70;
    List<List<String>> symbol=[["1","2","3","+"],
    ["4","5","6","-"],
    ["7","8","9","*"],
   ["C","0","=","/"]];
    return Scaffold(
      appBar: AppBar(
        title: Text("Material App Bar"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, 
      children: [
        Expanded(

          child: Container(
            
            color: Colors.yellow,
            child: Text(""),
          ),
        ),
        Expanded(
          flex: 2,
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < 4; i++)
              MyRow(symbol[i])  
              
           
           
           
            ],
          ),
        ))
      ]),
    );
  }
}
