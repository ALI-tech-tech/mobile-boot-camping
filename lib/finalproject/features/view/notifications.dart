import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/mylisttilenot.dart';

class Notificationmi extends StatefulWidget {
  static String rout="/Notificationmi";
   const Notificationmi({super.key});

  @override
  State<Notificationmi> createState() => _NotificationmiState();
}

class _NotificationmiState extends State<Notificationmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body:  Container(
      //width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          top: 15,
          left: 10
        ),
        color: Color.fromARGB(255, 45, 45, 45),
        margin: EdgeInsets.only(top: 5),
      child: ListView(
        children:[ 
          const Text("Today"),
          SizedBox(
            height: 75*5,
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return MyListTileNot(context);
              },
            ),
          ),
           const Text("Yesterday"),
          SizedBox(
            height: 75*5,
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return MyListTileNot(context);
              },
            ),
          ),
     ] ),
        )
  
  ,
    );
    
   
  }
}