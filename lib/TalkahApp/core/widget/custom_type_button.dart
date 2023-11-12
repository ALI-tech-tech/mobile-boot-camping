import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTypeButton extends StatefulWidget {
  late double width,height,redus;
  late Color color;
  Color? colorTxt;
  late String title;
  String? image;
  CustomTypeButton({super.key,required this.width,required this.height,required this.redus,required this.color,required this.title,this.image,required this.colorTxt});

  @override
  State<CustomTypeButton> createState() => _CustomTypeButtonState();
}

class _CustomTypeButtonState extends State<CustomTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: widget.color,borderRadius: BorderRadius.circular(widget.redus)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          if(widget.image != null)
          Center(
            child: Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.image!),fit: BoxFit.cover,),
                  color: Colors.white, borderRadius: BorderRadius.circular(20),border: Border.all(color: Color(0xffd484e5a))),
              width: 30,
              height: 40,
            ),
          ),
          SizedBox(width: 10,),
          Text(
            widget.title,
            style: TextStyle(color: widget.colorTxt),
          ),
        ]),
      ),
    );
  }
}
