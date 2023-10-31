
import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';
import '../Theme/size.dart';

Widget ContainerBarClip(BuildContext context){
  return ClipPath(
                    clipper: BannerClipper(),
                    child: Container(
                      clipBehavior: Clip.none,
                      height: 200,
                      width: getWidth(context),
                      color: App_Color.Primary,
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