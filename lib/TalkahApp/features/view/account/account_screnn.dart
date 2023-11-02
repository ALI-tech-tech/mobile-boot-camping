import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/widget/Containerlogo.dart';
import 'package:icons_plus/icons_plus.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        leading: Containerlogo(Logo(Logos.docker)),
        title: ListTile(
          title: Text("علي"),
          subtitle: Text("715924217"),
        )
      ),
      body: Stack(
        children: [

        ],
      ),
    ));
  }
}