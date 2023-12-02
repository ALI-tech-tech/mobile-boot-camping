import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:jobsfinder/core/localdatabase/entities/company.dart';
import 'package:jobsfinder/core/localdatabase/entities/job_post.dart';
import 'package:jobsfinder/feature/viewmodel/company_view_model.dart';
import 'package:jobsfinder/feature/viewmodel/user_view_model.dart';

import '../../../helpers/db_helper.dart';
import '../home_page/widgets/home_item_widget.dart';
import 'package:jobsfinder/core/app_export.dart';
import 'package:jobsfinder/core/widgets/app_bar/appbar_circleimage.dart';
import 'package:jobsfinder/core/widgets/app_bar/appbar_image_1.dart';
import 'package:jobsfinder/core/widgets/app_bar/appbar_subtitle.dart';
import 'package:jobsfinder/core/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:jobsfinder/core/widgets/app_bar/custom_app_bar.dart';
import 'package:jobsfinder/core/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  UserViewModel uVM = UserViewModel();
  CompanyViewModel cVM = CompanyViewModel();
  GetStorage box = GetStorage();
  String? path;

  getpath() async {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      path = box.read("profile");
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uVM.getimgeprofile();
    getpath();
    cVM.readAllCompanies();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: 70,
          leadingWidth: getHorizontalSize(74),
          leading: AppbarCircleimage(
            file: path == null ? null : File(path!),
            imagePath: path ?? ImageConstant.profile,
            margin: getMargin(
              top: 5,
              left: 24,
            ),
          ),
          title: Padding(
            padding: getPadding(
              top: 3,
              left: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppbarSubtitle(
                  text: "Hi, Welcome Back! 👋",
                ),
                AppbarSubtitle2(
                  text: "Find your dream job",
                  margin: getMargin(
                    top: 9,
                    right: 33,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            AppbarImage1(
              svgPath: ImageConstant.imgGroup162903,
              margin: getMargin(
                left: 24,
                top: 17,
                right: 24,
                bottom: 13,
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AppRoutes.settingsScreen);
              },
            ),
          ],
        ),
        body: SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CustomSearchView(
                    margin: getMargin(
                      left: 24,
                      top: 30,
                      right: 24,
                    ),
                    controller: searchController,
                    hintText: "Search...",
                    hintStyle: CustomTextStyles.titleMediumBluegray400,
                    alignment: Alignment.center,
                    prefix: Container(
                      margin: getMargin(
                        left: 16,
                        top: 17,
                        right: 8,
                        bottom: 17,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgSearch,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(52),
                    ),
                    suffix: Container(
                      margin: getMargin(
                        left: 30,
                        top: 17,
                        right: 16,
                        bottom: 17,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgFilterPrimary,
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(52),
                    ),
                  ),
                ),

                
                Padding(
                  padding: getPadding(
                    left: 24,
                    top: 22,
                  ),
                  child: Text(
                    "Recent Jobs",
                    style: CustomTextStyles.titleMediumInter,
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      left: 24,
                      top: 16,
                      right: 24,
                    ),
                    child: 
                    FutureBuilder(
                      future: DBHelper.database.jobpostdao.getAllJobPosts(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (
                                context,
                                index,
                              ) {
                                return SizedBox(
                                  height: getVerticalSize(16),
                                );
                              },
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                print((snapshot.data[index] as JobPost)
                                    .companyId);

                                //Company co=cVM.allCompanies.where((element) => element.id==(snapshot.data[index] as JobPost).companyId,).first;
                                return HomeItemWidget(
                                    jpost: snapshot.data[index] as JobPost);
                              },
                            );
                          } else {
                            return Center(
                              child: Text(
                                "EMPTY",
                                style: TextStyle(
                                    fontSize: 50, color: Colors.black),
                              ),
                            );
                          }
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
