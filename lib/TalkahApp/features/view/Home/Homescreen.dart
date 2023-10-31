import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/app_colors.dart';
import 'package:flutter_practis/TalkahApp/core/widget/containerbarclippath.dart';
import 'package:flutter_practis/TalkahApp/core/widget/iconappbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
       appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: App_Color.Primary,
        actions: [iconAppbar(context, Icon(Icons.notifications_none_rounded, size: 30,color: Colors.white,))],
        title: ListTile(title: Text("titl"),
        subtitle: Text("titl"),
        
        ),
        
       ),
        body:Column(
          children: [
             //ContainerBarClip(context),
          ],
        )
      ),
    );
  }
}