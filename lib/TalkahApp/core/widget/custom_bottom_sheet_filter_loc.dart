import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/widget/custom_radio_filter.dart';


class CustomBottomSheetFilter extends StatelessWidget {
  const CustomBottomSheetFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
              child: Container(
                width: 70,
                height: 6,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius:
                    BorderRadius.all(Radius.circular(15))),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close_outlined,
                            color: Colors.black45,
                          )),
                      Text("العرض حسب",
                          style: TextStyle(
                              color: Color(0xffd484e5a),
                              fontSize: 21,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomRadioFilter(title: "المقترحة لك", value: "المقترحة لك", groupValue: "type"),
                  SizedBox(height: 10,),
                  CustomRadioFilter(title: "الاحدث إضافة", value: "الاحدث إضافة", groupValue: "type"),
                  SizedBox(height: 10,),
                  CustomRadioFilter(title: "الأقرب منك", value: "الأقرب منك", groupValue: "type"),
                  SizedBox(height: 10,),
                  CustomRadioFilter(title: "الأكثر تقييماً", value: "الأكثر تقييما", groupValue: "type"),
                  SizedBox(height: 10,),
                ],
              )),
        ],
      ),
    );
  }
}
