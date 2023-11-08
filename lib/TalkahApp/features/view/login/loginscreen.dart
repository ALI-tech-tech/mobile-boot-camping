import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/app_colors.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/TalkahApp/core/constant/App_image.dart';
import 'package:flutter_practis/TalkahApp/core/constant/App_name.dart';
import 'package:flutter_practis/TalkahApp/core/utils/App_images.dart';
import 'package:flutter_practis/TalkahApp/core/widget/TextformField.dart';
import 'package:flutter_practis/TalkahApp/routes/app_routs.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../core/widget/containerbarclippath.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: 
         AppBar(
            flexibleSpace: Container(
              width: getWidth(context),
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(appbarBKImagetop), fit: BoxFit.fill)),
            
            ),
            elevation: 0,
          ),
          
        body: SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ContainerBarClip(context, 200),
                  Container(
                    width: getWidth(context),
                    height: (getHeight(context) / 3) - 60,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 40, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "تسجيل الدخول",
                                    style: App_TextStyle.appbarheader,
                                  ),
                                ),
                                Text(
                                  "اهلا بك في منصة ${App_Name} 👋",
                                  style: App_TextStyle.appbarbody,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 180,
                          width: (getWidth(context)/2)-10,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(App_Images.motorbic),
                                  fit: BoxFit.fill)
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
             
              SizedBox(
                height: 75,
              ),
              Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Text(
                        "رقم الجوال ",
                        style: App_TextStyle.BodyHeadr,
                      ),
                      Text("*",style:TextStyle(color: Colors.red) ,)
                    ],
                  )),
              Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: textFormFeild(context,
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              width: 20,
                              height: 15,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/talka/icons/arabic.png"))
                              ),
                            )),
                          Text("+967",style: App_TextStyle.Bodycontent,),
                          Padding(padding: EdgeInsets.all(0),
                          child: Text("|",style: TextStyle(fontSize: 26),), )
                        ],
                      ),
                      "77- --- ---"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(getWidth(context) - 50, 60),
                      backgroundColor: App_Color.btnlogin,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.otpscreen);
                    },
                    child: Text("تسجيل الدخول", style: App_TextStyle.appbarbody,)),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.otpscreen);
                      }, child: Text("المتابعة بدون تسجيل ", style: App_TextStyle.BodyHeadr.copyWith(color: Colors.grey),)),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

