// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:jobsfinder/core/app_export.dart';
import 'package:jobsfinder/core/localdatabase/entities/company.dart';
import 'package:jobsfinder/core/localdatabase/entities/job_post.dart';
import 'package:jobsfinder/core/widgets/custom_elevated_button.dart';
import 'package:jobsfinder/core/widgets/custom_icon_button.dart';
import 'package:jobsfinder/helpers/db_helper.dart';

// ignore: must_be_immutable
class HomeItemWidget extends StatefulWidget {
  JobPost jpost;

  HomeItemWidget({
    Key? key,
    required this.jpost,
  });

  @override
  State<HomeItemWidget> createState() => _HomeItemWidgetState();
}

class _HomeItemWidgetState extends State<HomeItemWidget> {
  Company? co;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(
          all: 16,
        ),
        decoration: AppDecoration.outlineIndigo.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: FutureBuilder(
          future: DBHelper.database.companydao
        .getCompanyById(widget.jpost.companyId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              
              if (snapshot.hasData) {
                
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomIconButton(
                          height: getSize(48),
                          width: getSize(48),
                          padding: getPadding(
                            all: 8,
                          ),
                          child: CustomImageView(
                            file:  File(((snapshot.data)as Company).image!) ,
                            imagePath:ImageConstant.profile ,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 12,
                            top: 4,
                            bottom: 2,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "",
                                style: CustomTextStyles.titleMediumBold_1,
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 5,
                                ),
                                child: Text(
                                  ((snapshot.data)as Company).name,
                                  style: CustomTextStyles
                                      .labelLargeBluegray300SemiBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgBookmark,
                          height: getSize(24),
                          width: getSize(24),
                          margin: getMargin(
                            bottom: 25,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: getPadding(
                        left: 60,
                        top: 9,
                      ),
                      child: Text(
                        widget.jpost.jobLocation,
                        //"560 - 12.000/Month",
                        style: CustomTextStyles.labelLargeGray600_1,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          top: 13,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomElevatedButton(
                              height: getVerticalSize(28),
                              width: getHorizontalSize(70),
                              text: "Fulltime",
                              buttonTextStyle: theme.textTheme.labelLarge!,
                            ),
                            CustomElevatedButton(
                              height: getVerticalSize(28),
                              width: getHorizontalSize(103),
                              text: widget.jpost.createdDate,
                              margin: getMargin(
                                left: 8,
                              ),
                              buttonTextStyle: theme.textTheme.labelLarge!,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  getcomany() async {
    co = await DBHelper.database.companydao
        .getCompanyById(widget.jpost.companyId);
   // setState(() {});
    return co;
  }
}
