import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  late String content; 
   MyContainer(this.content);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,height: 50,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Center(child: Text("+",style: TextStyle(color: Colors.black,fontSize: 20),)),
        ),
        Center(child: Text(this.content,style: TextStyle(color: Colors.black,fontSize: 16),),)
      ],
    );
  }
}