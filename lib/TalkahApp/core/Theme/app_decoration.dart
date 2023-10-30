import 'package:flutter/material.dart';

class App_Decoration {
  static BoxDecoration get fillWhite => BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadiusStyle.roundedBorder2,
      );
  static BoxDecoration get fillTeal => BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadiusStyle.roundedBorder2,
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16,
      );

  // Rounded borders
  static BorderRadius get roundedBorder2 => BorderRadius.circular(
        2,
      );
}
