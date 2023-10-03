import 'package:day23/MyCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Studentapp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Material App Bar"),),
      body: Container(
        color: Colors.white12,
        child: Column(children: [
          Container(height: 20,),
          MyCard(name: "ALi",job: "Engineer",major: "Cs",)
        ]),
      ),
    );
  }
}