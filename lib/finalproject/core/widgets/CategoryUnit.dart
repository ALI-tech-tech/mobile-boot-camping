import 'package:flutter/material.dart';

import 'package:flutter_practis/finalproject/core/widgets/Textstyle.dart';

class CatergoryUnit extends StatefulWidget {
  String? img;
  CatergoryUnit({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  State<CatergoryUnit> createState() => _CatergoryUnitState();
}

class _CatergoryUnitState extends State<CatergoryUnit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
        
        leading: Container(
          width: 80,
          height: 200,
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
                  backgroundColor: Colors.amber),
            ),
            Text(
              "Ali",
              style: TextStyleTheme.headertext(),
            ),
            Text(
              "Ali",
              style: TextStyle(fontSize: 10, color: Colors.amber),
            ),
            Row(
              children: [
                for (int i = 0; i < 3; i++)
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15,
                  ),
                for (int i = 0; i < 2; i++)
                  Icon(
                    Icons.star_border,
                    color: Colors.white,
                    size: 15,
                  ),
              ],
            )
          ],
        ),
      ),
    );
    
  }
}
