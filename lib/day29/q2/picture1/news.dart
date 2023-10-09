import 'package:flutter/material.dart';

import 'PlayerCard.dart';


class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading:
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("News",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert_rounded),
            ),
            
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            tabs: [
            Tab(child: Text("For you")),
            Tab(child: Text("Latest")),
            Tab(child: Text("Transfers")),
            Tab(child: Text("Leagues")),
          ]),
        ),
        body: TabBarView(children: [
         
          Container(),
          Container(),
          PlayCard(),
          Container(),
        ],)
      )),
    );
  }
}