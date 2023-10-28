import 'package:flutter/material.dart';

Widget MyListTileNot(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: 17),
    height: 40,
    width: MediaQuery.of(context).size.width,
    child: ListTile(
      leading: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(5)),
        width: 30,
        height: 30,
        child: Center(
          child: Icon(
            Icons.notifications_none,
            size: 14,
          ),
        ),
      ),
      title: Text("data"),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("data"),
          Text(
            "data",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      trailing: Icon(Icons.more_vert),
    ),
  );
}
