import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonTawseel extends StatelessWidget {
  late String image, title;
  late Color color,colorTxt;
  Color? colorIcon;
  late double width, height;
  double? redus;
  CustomButtonTawseel(
      {super.key,
        required this.image,
        required this.title,
        required this.color,
        required this.width,
        required this.height,
        required this.colorTxt,
        this.colorIcon,
        this.redus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(redus!)),
      width: width,
      height: height,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 70,width: 40,decoration: BoxDecoration(color: Colors.white.withOpacity(0.1),borderRadius: BorderRadius.circular(15)),child: Center(child: SvgPicture.asset(image,height: 20,))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontSize: 18,color: colorTxt)),
                SizedBox(height: 5,),
                Text("---------------------",style: TextStyle(fontSize: 15,color: colorTxt)),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(Icons.arrow_forward_ios,color: colorIcon ?? Colors.white,size: 22),
            ),
          ]),
    );
  }
}
