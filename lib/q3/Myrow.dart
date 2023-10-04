import 'package:flutter/material.dart';

class Myrow extends StatelessWidget {
 
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
      children: [
        for(int i=1;i<=3;i++)
         
         Image.asset("assets/images/${i}.jpg",cacheHeight: 134,cacheWidth: 134,),
         
      ],
    );
  }
}