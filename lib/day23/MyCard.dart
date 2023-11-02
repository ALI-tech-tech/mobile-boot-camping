import 'package:flutter/material.dart';

import 'Container.dart';
import 'OneRow.dart';

class MyCard extends StatelessWidget {
  String? name;
  String? job;
  String? major;
  MyCard({this.name, this.job, this.major});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        width: 370,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyContainer(),
            Container(
              padding: EdgeInsets.all(7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OneRow("Name : ${this.name}"),
                  OneRow("Job : ${this.job}"),
                  OneRow("Major : ${this.major}"),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [Text("Add"), Icon(Icons.add)],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
