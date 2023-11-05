import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/constant/App_image.dart';

import '../Theme/app_colors.dart';
import '../Theme/size.dart';

Widget ContainerBarClip(BuildContext context, double height) {
  return ClipPath(
    clipper: BannerClipper(),
    child: Container(
      clipBehavior: Clip.none,
      height: height,
      width: getWidth(context),
      decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage(appbarBKImagetop),fit: BoxFit.fill)
      ),
      // child: Container(
      //   width: getWidth(context),
      //   height: height*2,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(image: AssetImage(appbarBKImagebottom), fit: BoxFit.fill)
      //   ),
      // ),
      //color: App_Color.Primary,
    ),
  );
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
