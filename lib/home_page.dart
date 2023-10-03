

import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Material App Bar"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: [
          Expanded(
            child: Container(
              child: Text(""),
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              child: Text(""),
              color: Colors.red,
            ),
          ),
          Row(children: [
            Expanded(
              child: Container(
                height: 50,
                child: Text(""),
              color: Colors.blue,
                      ),
            ),
          Expanded(
            child: Container(
              height: 50,
              child: Text(""),
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: Text(""),
              color: Colors.yellow,
            ),
          ),
          ],)
        ],
      ),
    );
  }
}
