import 'package:flutter/material.dart';

Widget category_icon({required IconData icon , required String title}) {
  return Container(
    margin: EdgeInsets.only(left: 20),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}
