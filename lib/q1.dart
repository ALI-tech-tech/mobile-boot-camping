import 'package:day26/Rowbox.dart';
import 'package:day26/box.dart';
import 'package:day26/op.dart';
import 'package:flutter/material.dart';

class q1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                ),
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(60)),
                  ),
                ),
                Center(
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45)),
                    child: Center(
                        child: Text(
                      "150 %",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Positioned(
                    top: 300,
                    left: 50,
                    child: Container(
                        width: 300,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [RowBox(), RowBox()],
                        ))),
                Positioned(left: 53, top: 500, width: 300, child: MyrowCon(3)),
                Positioned(
                  width: 300,
                  left: 53,
                  top: 600,
                  child: MyrowCon(3),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Container())
      ],
    );
  }
}
