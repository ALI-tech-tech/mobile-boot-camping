import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRadioFilter extends StatefulWidget {
  late String title,value,groupValue;
  CustomRadioFilter({super.key,required this.title,required this.value,required this.groupValue,});

  @override
  State<CustomRadioFilter> createState() => _CustomRadioFilterState();
}

class _CustomRadioFilterState extends State<CustomRadioFilter> {
  Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if(borderColor==Color(0xffd245389))
            borderColor == null;
          else
            borderColor = Color(0xffd245389);
        });
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.only(right: 20,left: 20),
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1),borderRadius: BorderRadius.circular(15),border: Border.all(width: 1,color:borderColor ?? Colors.grey.withOpacity(0),)),
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent, borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0xffd484e5a))),
              width: 20,
              height: 20,
              child: Center(
                child: Radio(
                  value: widget.value,
                  groupValue: widget.groupValue,
                  onChanged: (value) {
                    setState(() {
                      widget.groupValue = value!.toString();
                    });
                  },
                  activeColor: Color(0xffd245389),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Text(
              widget.value,
              style: TextStyle(color: Color(0xffd484e5a),fontSize: 16),
            ),
          ]),
        ),
      ),
    );
  }
}
