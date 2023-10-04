import 'package:day26/q3/Myrow.dart';
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for(int i=1;i<=5;i++)
              Myrow(),
              
            ],
          ),
        ),
    );
   
  }
}