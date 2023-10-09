
import 'package:flutter/material.dart';

import 'Container.dart';

class MyRow extends StatelessWidget {
  List<String> content=[];
  MyRow(this.content);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[ 
      for (var i = 0; i < this.content.length; i++)
       MyContainer(content: content[i],)
      ]);
  }
}
