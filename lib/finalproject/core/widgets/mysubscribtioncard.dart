import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/radios.dart';

class MySubscribtionCard extends StatefulWidget {
   MySubscribtionCard({super.key});

  @override
  State<MySubscribtionCard> createState() => _MySubscribtionCardState();
}

class _MySubscribtionCardState extends State<MySubscribtionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black
                  ), 
                  onPressed: (){}, child: Text("Active")),
                  
                  Row(
                    children: [Switch(value: false, onChanged: (v){}, activeColor: Colors.amber, inactiveThumbColor: Colors.amber),
                    Text("Auto ReNew")],
                  ),
                  Text("Change Plan",style: TextStyle(color: Colors.amber),)
              ],
              
            ),
            ListTile(
              title:Text("STANDARD PLAN") ,
              subtitle: Text("Subcribtion ID: ${"100394949"}"),
            ),
            Divider(color: Colors.black, height: 20, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Started on"),
                      Text("15 may,2020"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price"),
                      Text("560 USD"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Access"),
                      Text("Unlimited"),
                    ],
                  ),
                ),
              ],
            )
            
          ],
        ),
      ),
    );
  }
}