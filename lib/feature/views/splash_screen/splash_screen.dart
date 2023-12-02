import 'package:get_storage/get_storage.dart';
import 'package:jobsfinder/core/app_export.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GetStorage box=GetStorage();
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
   
    mediaQueryData = MediaQuery.of(context);
    time(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SizedBox(
          width: double.maxFinite,
          child: CustomImageView(
            svgPath: ImageConstant.imgGroup162797,
            height: getVerticalSize(153),
            width: getHorizontalSize(102),
            alignment: Alignment.center,
            margin: getMargin(
              bottom: 5,
            ),
          ),
        ),
      ),
    );
  }

  time(BuildContext context) {
    print(box.read("is_logged_in"));
    if (box.read("is_logged_in")??false) {
      Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.pushReplacementNamed(context, AppRoutes.homeContainerScreen));
    }else {
      Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.pushReplacementNamed(context, AppRoutes.onboardingOneScreen));
    }
  }
}
