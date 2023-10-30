import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/app_colors.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/TalkahApp/core/widget/TextformField.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipPath(
              clipper: BannerClipper(),
              child: Container(
                height: 200,
                width: getWidth(context),
                color: App_Color.Primary,
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Text("رقم الجوال "),
            Container(
              margin: EdgeInsets.all(10),
              child: textFormFeild(Row(
                    children: [
                      Icon(Icons.key),
                      Text("+967"),
                      Text("|"),
                    ],
                  ),"77- --- ---"),
              
              // TextFormField(
              //   decoration: InputDecoration(
              //     prefix: Row(
              //       children: [
              //         Icon(Icons.key),
              //         Text("+967"),
              //         Text("|"),
              //       ],
              //     ),
              //     hintText: "77- --- ---",
              //   ),
              // ),
          
            ),
            SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(getWidth(context) - 50, 60),
                      backgroundColor: App_Color.btnlogin,
                      
                      ),
                  onPressed: () {},
                  child: Text("تسجيل الدخول")),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: TextButton(onPressed: (){}, child: Text("المتابعة بدون تسجيل ")),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;

    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
