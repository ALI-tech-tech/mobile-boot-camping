
import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.brown[6]
      ),
      child: Column(
        children: [
           
              //  Container(
              //    child: ListTile(
              //       leading: Icon(Icons.circle,size: 8,color: Colors.black,),
              //       title: Text("150 %"),
              //       subtitle:Text("qwww") ,
              //     ),
              //  ),
             
           
         
        ],
      ),
    );
  }
}