// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_practis/day37/controller/gpacontroller.dart';

class MyDrop extends StatefulWidget {
  GpaController gpa;
  MyDrop({
    Key? key,
    required this.gpa,
  }) : super(key: key);

  @override
  State<MyDrop> createState() => _MyDropState();
}

class _MyDropState extends State<MyDrop> {
  String? value;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
     value=widget.gpa.gpaAll[0].letter!+'-'+widget.gpa.gpaAll[0].gpa_scale.toString();
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton(

              value: value,
                items: List.generate(
                    widget.gpa.gpaAll.length,
                    (index) => DropdownMenuItem(
                      value: widget.gpa.gpaAll[index].letter!+'-'+widget.gpa.gpaAll[index].gpa_scale.toString(),
                        child: Text(
                            "${widget.gpa.gpaAll[index].letter}-${widget.gpa.gpaAll[index].gpa_scale}"))),
                onChanged: (v) {
                  value=v!;
                  setState(() {
                    
                  });
                })
          ;
  }
}