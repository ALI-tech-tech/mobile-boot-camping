import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/app_colors.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';

Widget textFormFeild(BuildContext context, Widget? suffix, String? Hint) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Container(
      width: getWidth(context) - 50,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue[200]!.withOpacity(0.3)),
          color: App_Color.txtfildfill,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          suffix ?? Text(""),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              style: App_TextStyle.Bodycontent,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: Hint,
                
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
