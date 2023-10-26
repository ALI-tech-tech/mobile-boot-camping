import 'package:flutter/material.dart';

class NoThingToFound extends StatelessWidget {
  const NoThingToFound({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Container(height: 200,width: 200,color: Colors.amber,),
            Icon(Icons.android_rounded, size: 300, color: Colors.green,),
            Text("No Thing To Display ", style: TextStyle(fontSize: 30),),
          ],
        
      ),
    );
  }
}