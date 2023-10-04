import 'package:day26/q3/avatar.dart';
import 'package:day26/q3/pagecontent.dart';
import 'package:flutter/material.dart';

import 'description.dart';

class Profile extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Avatar(),
        Divider(),
        Description(),
        Divider(),
        PageContent(),
      ],
    );
  }
}