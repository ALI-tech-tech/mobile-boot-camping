import 'package:flutter/material.dart';

class OneRow extends StatelessWidget {
  String txt;
  OneRow(this.txt);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(txt)
      ],
    );
  }
}