import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/TalkahApp/core/widget/iconappbar.dart';
import 'package:flutter_practis/TalkahApp/core/widget/mycard.dart';
import 'package:flutter_practis/day23/MyCard.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: iconAppbar(context:  context,bkground: Colors.white.withOpacity(0.3), widget: Icon(Icons.arrow_back), callback: (){
            Navigator.pop(context);
          }),
          title: Center(child: Text("الاشعارات", style: App_TextStyle.appbarheader)),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: ((context, index) =>NCard(context,getWidth(context),"العنوان", "المحتوى",) )),
        ),
      ),
    );
  }
}