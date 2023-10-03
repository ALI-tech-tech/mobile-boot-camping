import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  String content;
  double width;
  double heigth;
  MyContainer({this.content="",this.heigth=70,this.width=70});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.orange,
      ),
      width: this.width,
      height: this.heigth,
      child: Center(
          child: Text(
        this.content,
        style: TextStyle(color: Colors.white, fontSize: 30),
      )),
    );
  }
}
