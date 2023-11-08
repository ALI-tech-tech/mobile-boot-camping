import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/TalkahApp/core/widget/Containerlogo.dart';
import 'package:flutter_practis/TalkahApp/core/widget/bksvg.dart';
import 'package:flutter_practis/TalkahApp/core/widget/blockcontainer.dart';
import 'package:flutter_practis/TalkahApp/core/widget/containerbarclippath.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              flexibleSpace: ListTile(
                leading: Containerlogo(
                    SvgPicture.asset("assets/talka/icons/app-logo.svg"),10, 60, 50),
                title: Text(
                  "علي",
                  style: App_TextStyle.appbarheader,
                ),
                subtitle: Text(
                  "715924217",
                  style: App_TextStyle.appbarbody,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ContainerBarClip(context, 100),
                      Positioned(
                        top: 30,
                        right: 23,
                        child: Center(
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
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      bksvg(
                                          SvgPicture.asset(
                                            "assets/talka/icons/timer.svg",
                                          ),
                                          40,
                                          40,
                                          15),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("0", style: App_TextStyle.Bodycontent,),
                                          Text("طلباتي الحالية", style: App_TextStyle.Bodycontent,),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "|",
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.grey.withOpacity(0.3)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      bksvg(
                                          SvgPicture.asset(
                                            "assets/talka/icons/timer.svg",
                                          ),
                                          40,
                                          40,
                                          15),
                                      
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("0", style: App_TextStyle.Bodycontent,),
                                          Text("اجمالي طلباتي",style: App_TextStyle.Bodycontent,),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Text("عن المستخدم", style: App_TextStyle.Bodycontent.copyWith(fontSize: 16),)),
                 Center(
                   child: Column(
                    
                    children: [
                       blockcontainer(
                        bksvg(SvgPicture.asset("assets/talka/icons/edit.svg"), 40, 40, 12),
                        Text("بياناتي", style: App_TextStyle.Bodycontent,),
                        Text("قم بتغيير بياناتك الشخصيه", style: App_TextStyle.Bodycontent),
                        Icon(Icons.arrow_forward),
                        getWidth(context) - 40,
                        80,
                        15,
                        () {}),
                    blockcontainer(
                       bksvg(SvgPicture.asset("assets/talka/icons/gallery.svg"), 40, 40, 12),
                        Text("العناوين", style: App_TextStyle.Bodycontent),
                        Text("قم بتغيير بيانات عنوانك", style: App_TextStyle.Bodycontent),
                        Icon(Icons.arrow_forward),
                        getWidth(context) - 40,
                        80,
                        15,
                        () {}),
                    blockcontainer(
                        bksvg(SvgPicture.asset("assets/talka/icons/setting.svg"), 40, 40, 12),
                        Text("الاعدادات", style: App_TextStyle.Bodycontent),
                        Text("اللغة,سياسة الخصوصية,الشروط والاحكام", style: App_TextStyle.Bodycontent),
                        Icon(Icons.arrow_forward),
                        getWidth(context) - 40,
                        80,
                        15,
                        () {}),
                    
                    ],
                   ),
                 ),
                  
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Text("data", style: App_TextStyle.Bodycontent.copyWith(fontSize: 16))),
                  Center(
                   child: Column(
                    
                    children: [
                       blockcontainer(
                        bksvg(SvgPicture.asset("assets/talka/icons/call-calling-2.svg"), 40, 40, 12),
                        Text("title", style: App_TextStyle.Bodycontent),
                        Text("subtitle", style: App_TextStyle.Bodycontent),
                        Icon(Icons.arrow_forward),
                        getWidth(context) - 40,
                        80,
                        15,
                        () {}),
                    blockcontainer(
                        bksvg(SvgPicture.asset("assets/talka/icons/developer-icon.svg"), 40, 40, 12),
                        Text("title", style: App_TextStyle.Bodycontent),
                        Text("subtitle", style: App_TextStyle.Bodycontent),
                        Icon(Icons.arrow_forward),
                        getWidth(context) - 40,
                        80,
                        15,
                        () {}),
                    blockcontainer(
                        bksvg(SvgPicture.asset("assets/talka/icons/share.svg"), 40, 40, 12),
                        Text("title", style: App_TextStyle.Bodycontent),
                        Text("subtitle", style: App_TextStyle.Bodycontent),
                        Icon(Icons.arrow_forward),
                        getWidth(context) - 40,
                        80,
                        15,
                        () {}),
                    
                    ],
                   ),
                 ),
                  
                ],
              ),
            ),
          )),
    );
  }
}
