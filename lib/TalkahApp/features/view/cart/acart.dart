import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/TalkahApp/core/constant/App_image.dart';
import 'package:flutter_svg/svg.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
                            "السلة",
                            style: App_TextStyle.appbarheader,
                          ),
                  ),
                  elevation: 0,
                ),
          body: Container(
            child: Column(
             
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        SvgPicture.asset("assets/talka/icons/cart.svg", height: 50, width: 50,),
                        Text(
                          "السلة فارغة",
                          style: App_TextStyle.Bodycontent,
                        ),
                        Text(
                          " لم تقم باضافة اي عناصر حتلى الان",
                          style: App_TextStyle.Bodycontent,
                        ),
                       
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
