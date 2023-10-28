// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_practis/finalproject/core/widgets/Textstyle.dart';

class WachListunit extends StatefulWidget {
  String img = "";
  WachListunit({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  State<WachListunit> createState() => _WachListunitState();
}

class _WachListunitState extends State<WachListunit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
        leading: Container(
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/${widget.img}"),
                fit: BoxFit.fill),
          ),
          child: Center(child: Icon(Icons.play_arrow),),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "HD",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  backgroundColor: Colors.yellow),
            ),
            Text(
              "Ali",
              style: TextStyleTheme.headertext(),
            ),
            Text(
              "Ali",
              style: TextStyle(color: Colors.yellow),
            ),
            Row(
              children: [
                for (int i = 0; i < 3; i++)
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 15,
                  ),
                for (int i = 0; i < 2; i++)
                  Icon(
                    Icons.star_border,
                    color: Colors.white,
                    size: 15,
                  ),
              ],
            ),
            
          ],
        ),
        trailing: Container(width: 100,
          child: 
                Radio(
                  fillColor: MaterialStatePropertyAll(Colors.white),
                  value: 1, groupValue: 2, onChanged: (v){})
              
        ),
      ),
    );
    ;
  }
}
