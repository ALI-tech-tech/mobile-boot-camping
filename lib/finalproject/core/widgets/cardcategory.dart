// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CardCategory extends StatefulWidget {
  String title;
  String icon;
  bool choose;
  CardCategory({
    Key? key,
    required this.title,
    required this.icon,
    required this.choose,
  }) : super(key: key);

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  bool active=false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 140,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white),
            child: Logo(widget.icon),
          ),
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ), widget.choose?Container(
        width:140 ,
        height: 150,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.3)
        ) ,
        child: Center(child: Icon(Icons.check_circle, color: Colors.amber,size: 50),),
      ):Container(
        color: Colors.transparent,
        
      )
      
      
      ]
    );
  }
}
