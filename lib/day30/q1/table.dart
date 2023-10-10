import 'package:flutter/material.dart';
import 'package:flutter_practis/day30/q1/userinfo.dart';

class MyTable extends StatelessWidget {
  UserInfo? us;
  List<UserInfo> li=[];
   MyTable({required this.li});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(" User Info"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Table(
              border: TableBorder.all(width: 1, ),
              children: [
                TableRow(children: [
                  TableCell(child: Text("Name")),
                  TableCell(child: Text("Phone")),
                ]),
                for(var u in li)
                TableRow(children: [
                  TableCell(child: Text("${u.name}")),
                  TableCell(child: Text("${u.phone}")),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}