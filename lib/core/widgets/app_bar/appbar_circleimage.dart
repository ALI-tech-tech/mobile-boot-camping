import 'dart:io';
import 'dart:typed_data';

import 'package:jobsfinder/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarCircleimage extends StatelessWidget {
  AppbarCircleimage({
    Key? key,
    this.file,
    this.imagePath,
    this.imageByte,
    this.svgPath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;
  Uint8List? imageByte;
  String? svgPath;
  File? file;
  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusStyle.roundedBorder24,
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          svgPath: svgPath,
          file: file,
          imagePath: imagePath,
          imagbyte: imageByte,
          height: getSize(50),
          width: getSize(50),
          fit: BoxFit.fill,
          radius: BorderRadius.circular(
            getHorizontalSize(25),
          ),
        ),
      ),
    );
  }
}
