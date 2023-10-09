
import 'package:flutter/material.dart';
import 'package:flutter_practis/day26/q3/avatar.dart';
import 'package:flutter_practis/day26/q3/pagecontent.dart';

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