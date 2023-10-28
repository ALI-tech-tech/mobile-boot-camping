import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/mysubscribtioncard.dart';

class SbScribtionPlansUser extends StatefulWidget {
  static String rout = "/SbScribtionPlansUser";
  SbScribtionPlansUser({super.key});

  @override
  State<SbScribtionPlansUser> createState() => _SbScribtionPlansUserState();
}

class _SbScribtionPlansUserState extends State<SbScribtionPlansUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text("MY SUBSCRIPTION"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
          color: Color.fromARGB(255, 45, 45, 45),
          margin: EdgeInsets.only(
            top: 5,
          ),
          child: ListView(
            children: [
              MySubscribtionCard(),
              MySubscribtionCard(),
            ],
          )),
    );
  }
}
