import 'package:flutter/material.dart';

Widget mycolumn(Widget up, Widget down ){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      up,
      down,
    ],
  );
}