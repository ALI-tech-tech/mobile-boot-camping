import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainerShop extends StatefulWidget {
  late String title, loc, rate, distance, time, image;
  late double width;
  CustomContainerShop({
    super.key,
    required this.title,
    required this.loc,
    required this.rate,
    required this.distance,
    required this.time,
    required this.image,
    required this.width,
  });

  @override
  State<CustomContainerShop> createState() => _CustomContainerShopState();
}

class _CustomContainerShopState extends State<CustomContainerShop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 120,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        SizedBox(width:70,child: Image(image: AssetImage(widget.image))),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  color: Color(0xffd484e5a), fontWeight: FontWeight.w500,fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.loc,
              style: TextStyle(
                  color: Color(0xffd656e7e),fontSize: 12),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.grey.withOpacity(0.5),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(widget.rate,style: TextStyle(
                    color: Color(0xffd656e7e), fontWeight: FontWeight.w600,fontSize: 10),),
                SizedBox(width: 5,),
                Text("(0)",style: TextStyle(
                    color: Color(0xffd656e7e).withOpacity(0.5),fontSize: 10),),
                SizedBox(
                  width: 10,
                ),
                Container(width: 7,height: 7,decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5),borderRadius: BorderRadius.circular(5)),),
                SizedBox(width: 5,),
                SvgPicture.asset("assets/talka/icons/location.svg",height: 15,),
                SizedBox(width: 5,),
                Text("${widget.distance} كيلو ",style: TextStyle(
                    color: Color(0xffd656e7e),fontSize: 10),),
                SizedBox(width: 5,),
                Container(width: 7,height: 7,decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5),borderRadius: BorderRadius.circular(5)),),
                SizedBox(width: 5,),
                SvgPicture.asset("assets/talka/icons/timer.svg",height: 15,),
                SizedBox(width: 5,),
                Text("${widget.time} دقيقة ",style: TextStyle(
                    color: Color(0xffd656e7e).withOpacity(0.5),fontSize: 10),),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
