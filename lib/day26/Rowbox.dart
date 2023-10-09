import 'package:flutter/material.dart';

class RowBox extends StatelessWidget {
  const RowBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for(int i=0;i<2;i++)
          Container(
                          child: Expanded(child:ListTile(leading: Icon(Icons.circle,size: 10,color: Colors.black,), title: Text("150 %"),subtitle: Text("qwww"),)),),
                                 
        ],
      ),
    );
  }
}