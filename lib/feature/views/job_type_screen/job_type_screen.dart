import 'package:jobsfinder/core/app_export.dart';
import 'package:jobsfinder/core/widgets/custom_elevated_button.dart';
import 'package:jobsfinder/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class JobTypeScreen extends StatefulWidget {
  const JobTypeScreen({Key? key}) : super(key: key);

  @override
  State<JobTypeScreen> createState() => _JobTypeScreenState();
}

class _JobTypeScreenState extends State<JobTypeScreen> {
  int selected=1;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 13, right: 24, bottom: 13),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgGroup162799,
                          height: getSize(24),
                          width: getSize(24),
                          alignment: Alignment.centerLeft,
                          onTap: () {
                            onTapImgImage(context);
                          }),
                      Padding(
                          padding: getPadding(top: 47),
                          child: Text("Choose job ",
                              style: theme.textTheme.headlineSmall)),
                      Container(
                          width: getHorizontalSize(209),
                          margin: getMargin(top: 7),
                          child: Text(
                              "Are you looking for a new job or\nlooking for new employee",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.titleSmallBluegray400_1
                                  .copyWith(height: 1.57))),
                      Padding(
                          padding: getPadding(top: 38, bottom: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        selected=1;
                                        setState(() {
                                          
                                        });
                                      },
                                      child: Container(
                                          margin: getMargin(right: 7),
                                          padding: getPadding(
                                              left: 18,
                                              top: 24,
                                              right: 18,
                                              bottom: 24),
                                          decoration:selected==1? AppDecoration.outlinePrimary
                                              .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder24):AppDecoration.outlineOnPrimary
                                              .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder24),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomIconButton(
                                                    height: getSize(64),
                                                    width: getSize(64),
                                                    padding: getPadding(all: 16),
                                                    decoration:
                                                        IconButtonStyleHelper
                                                            .fillPrimary,
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgWork)),
                                                Padding(
                                                    padding: getPadding(top: 29),
                                                    child: Text("Find a job",
                                                        style: theme.textTheme
                                                            .titleMedium)),
                                                Container(
                                                    width: getHorizontalSize(120),
                                                    margin: getMargin(top: 9),
                                                    child: Text(
                                                        "It’s easy to find your dream job here with us.",
                                                        maxLines: 3,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: theme
                                                            .textTheme.labelLarge!
                                                            .copyWith(
                                                                height: 1.67)))
                                              ])),
                                    )),
                                Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        selected=2;
                                        setState(() {
                                          
                                        });
                                      },
                                      child: Container(
                                          margin: getMargin(left: 7),
                                          padding: getPadding(
                                              left: 14,
                                              top: 24,
                                              right: 14,
                                              bottom: 24),
                                          decoration:selected==1 ? AppDecoration
                                              .outlineOnPrimary
                                              .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder24):AppDecoration
                                              .outlinePrimary
                                              .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder24),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomIconButton(
                                                    height: getSize(64),
                                                    width: getSize(64),
                                                    padding: getPadding(all: 16),
                                                    decoration:
                                                        IconButtonStyleHelper
                                                            .fillOrange,
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgProfile)),
                                                Padding(
                                                    padding: getPadding(top: 29),
                                                    child: Text("Find a employee",
                                                        style: theme.textTheme
                                                            .titleMedium)),
                                                Container(
                                                    width: getHorizontalSize(109),
                                                    margin: getMargin(top: 9),
                                                    child: Text(
                                                        "It’s easy to find employees here with us.",
                                                        maxLines: 3,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: theme
                                                            .textTheme.labelLarge!
                                                            .copyWith(
                                                                height: 1.67)))
                                              ])),
                                    ))
                              ]))
                    ])),
            bottomNavigationBar: CustomElevatedButton(
                text: "Continue",
                margin: getMargin(left: 24, right: 24, bottom: 55),
                buttonStyle: CustomButtonStyles.fillPrimary,
                onTap: () {
                  if (selected==2) {
                  onTapcontnuetocompany(context);
                  }else if (selected==1) {
                  onTapcontnuetoseeker(context);
                  }
                  
                })));
  }


  onTapcontnuetocompany(BuildContext context){
    Navigator.pushNamed(context, AppRoutes.completecompanysignUpScreen);
  }
onTapcontnuetoseeker(BuildContext context){
    Navigator.pushNamed(context, AppRoutes.completeseekersignUpScreen);
  }
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.speciallizationScreen);
  }

 
  onTapImgImage(BuildContext context) {
    Navigator.pop(context);
  }
}
