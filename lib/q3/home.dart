import 'package:day26/q3/description.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Material App Bar"),
              bottom: TabBar(tabs: [
                Tab(child: Column(children: [Icon(Icons.text_snippet)],),),
                 Tab(child: Column(children: [Icon(Icons.person)],),)
              ]),
            ),
            body: TabBarView(children: [
              Profile(),
              
              Text("data")
            ],)
           )
           );
             }
}
