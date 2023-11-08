import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/TalkahApp/core/constant/App_image.dart';
import 'package:flutter_practis/TalkahApp/core/widget/containerbarclippath.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Home/Homescreen.dart';


class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
              flexibleSpace: Container(
                padding: EdgeInsets.only(right: 10, top: 10),
                width: getWidth(context),
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(appbarBKImagetop), fit: BoxFit.fill)),
               child: Text(
                        "طلباتي",
                        style: App_TextStyle.appbarheader,
                      ),
              ),
              elevation: 0,
            ),
            
          body: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    ContainerBarClip(context, 100),
                    Center(
                      child: Container(
                                      height: 70,
                                      width: 320,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                                      ),
                                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          child: AnimatedContainer(
                            curve: Curves.easeInBack,
                            duration: Duration(milliseconds: 300),
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                              color:
                                  selectedIndex == 0 ? Colors.orange : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "الحالية",
                                style: App_TextStyle.Bodycontent.copyWith(color: selectedIndex == 0
                                      ? Colors.white
                                      : Colors.black,),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                              color:
                                  selectedIndex == 1 ? Colors.orange : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "السابقة",
                                style: App_TextStyle.Bodycontent.copyWith(color: selectedIndex == 1
                                      ? Colors.white
                                      : Colors.black,),
                              ),
                            ),
                          ),
                        ),
                      ],
                                      ),
                                    ),
                    ),
                  ],
                ),
                
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/talka/icons/empty-order.svg", height: 40, width: 40,),
                      Text(
                        "قائمة طلباتي فارغة",
                        style: App_TextStyle.Bodycontent,
                      ),
                      Text(
                        "ليس لديك طلبات حتى الان",
                        style: App_TextStyle.Bodycontent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
