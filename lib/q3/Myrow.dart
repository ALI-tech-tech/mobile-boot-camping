import 'package:flutter/material.dart';

class Myrow extends StatelessWidget {
 
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
      children: [
        for(int i=1;i<=3;i++)
         
         Container(
          padding: EdgeInsets.only(bottom: 2),
          child: Image.asset("assets/images/${i}.jpg",cacheHeight: 134,cacheWidth: 134,)),
         
      ],
    );
  }
}