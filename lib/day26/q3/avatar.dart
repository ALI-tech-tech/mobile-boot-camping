import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(15),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(backgroundImage: AssetImage("assets/images/ali.JPG"),),
          Column(children: [Text("5"),Text("Posts")],),
          Column(children: [Text("10"),Text("Followers")],),
          Column(children: [Text("12"),Text("Following")],),
        ],
      ),
    );
  }
}