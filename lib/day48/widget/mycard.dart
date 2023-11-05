import 'package:flutter/material.dart';

Widget customContainer({
  double? width,
  double? height,
  Color? color,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  Widget? child,
  double? shadowOpacity,
  double? shadowBlurRadius,
  Color? shadowColor,
}) {
  return Container(
    width: width,
    height: height,
    margin: margin,
    padding: padding,
    decoration: BoxDecoration(
      color: color,
      boxShadow: [
        BoxShadow(
          color: shadowColor ?? Colors.black.withOpacity(0.1),
          offset: Offset(0, 2),
          blurRadius: shadowBlurRadius ?? 4.0,
          spreadRadius: shadowOpacity ?? 0.0,
        ),
      ],
    ),
    child: child,
  );
}