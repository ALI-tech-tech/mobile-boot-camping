
import 'package:flutter/material.dart';
import 'package:flutter_practis/day26/container.dart';

class MyrowCon extends StatelessWidget {
  int count;
  MyrowCon(this.count);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for(int i=1;i<=count;i++)
        MyContainer("Title ${i}")
      ],
    );
  }
}