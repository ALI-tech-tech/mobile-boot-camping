import 'package:flutter/material.dart';

class q2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: Center(
                  child: Text(
                "1",
                style: TextStyle(fontSize: 40),
              )),
            ),
          ),
          Expanded(
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                    child: Center(
                        child: Text(
                      "2",
                      style: TextStyle(fontSize: 40),
                    )),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        
                        child: Container(
                          color: Colors.yellow,
                          child: Center(
                              child: Text(
                            "3",
                            style: TextStyle(fontSize: 40),
                          )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.purple,
                          child: Center(
                              child: Text(
                            "4",
                            style: TextStyle(fontSize: 40),
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              
              
              ],
            ),
          )
        
        ],
      ),
    );
  }
}
