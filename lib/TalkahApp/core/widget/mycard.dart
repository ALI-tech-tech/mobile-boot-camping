import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/TalkahApp/core/widget/iconappbar.dart';

Widget NCard(BuildContext context, double width, String header,String content){
  return Container(

    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
     
    ),
    
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        iconAppbar( bkground: Colors.grey[300]!, context: context, widget: Icon(Icons.notification_important_outlined, color: Colors.white,), callback: (){},height: 40, width: 40),
        Container(
          width: getWidth(context)/2,
          child: ListTile(
            title: Text(header,maxLines: 4,style: App_TextStyle.Bodycontent,),
            subtitle: Text(content,style: App_TextStyle.Bodycontent.copyWith(fontSize: 12),),
          ),
          
        ),
        Text("منذ 5 ساعات", style: App_TextStyle.Bodycontent.copyWith(fontSize: 10),),
      ],
    )
    
  );
}