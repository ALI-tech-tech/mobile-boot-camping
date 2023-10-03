import 'package:day23/Container.dart';
import 'package:day23/OneRow.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  String? name;
  String? job;
  String? major;
  MyCard({this.name, this.job, this.major});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        
        decoration: BoxDecoration(
         
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10)
        ),
        width: 400,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyContainer(),
            Column(
              children: [
                OneRow("Name : ${this.name}"),
                OneRow("Job : ${this.job}"),
                OneRow("Major : : ${this.major}"),
              ],
            ),
            ElevatedButton(
                onPressed: () {},
                child: Row(
                  
                  children: [Text("Add"), Icon(Icons.add)],
                ))
          ],
        ),
      ),
    );
  }
}
