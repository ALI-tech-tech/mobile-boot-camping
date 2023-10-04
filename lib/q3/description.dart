import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            
            
            child: Column(
              children: [
                Text(
                  "Ali Ben Jahlan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Mobile Devloper"),
                Text("You Wouldnot Expect"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    child: Text("Followeing")),
              ),
              Container(
                child:
                    ElevatedButton(onPressed: () {}, child: Text("Messages")),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {}, child: Icon(Icons.arrow_downward)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
