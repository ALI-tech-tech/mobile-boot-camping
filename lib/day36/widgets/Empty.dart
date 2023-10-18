import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hourglass_empty,size: 200, color: Colors.teal,),
            Text("No Thing to Display",style: TextStyle(fontSize: 25,color: Colors.teal),)
          ],
        ),
      ),
    );
  }
}