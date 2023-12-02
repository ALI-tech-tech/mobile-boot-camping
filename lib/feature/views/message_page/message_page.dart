import '../../../core/localdatabase/entities/job_post.dart';
import '../../../helpers/db_helper.dart';
import '../home_page/widgets/home_item_widget.dart';
import '../message_page/widgets/message_item_widget.dart';
import 'package:jobsfinder/core/app_export.dart';
import 'package:jobsfinder/core/widgets/app_bar/appbar_image.dart';
import 'package:jobsfinder/core/widgets/app_bar/appbar_title.dart';
import 'package:jobsfinder/core/widgets/app_bar/custom_app_bar.dart';
import 'package:jobsfinder/core/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class MessagePage extends StatelessWidget {
  MessagePage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(51),
                leadingWidth: getHorizontalSize(48),
                leading: AppbarImage(
                    svgPath: ImageConstant.imgGroup162799,
                    margin: getMargin(left: 24, top: 13, bottom: 14),
                    onTap: () {
                      onTapArrowbackone(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Favorites")),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(all: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomSearchView(
                          margin: getMargin(top: 4),
                          controller: searchController,
                          hintText: "Search Message...",
                          hintStyle: CustomTextStyles.titleMediumBluegray400,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 17, right: 8, bottom: 17),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgSearch)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(52)),
                          suffix: Container(
                              margin: getMargin(
                                  left: 30, top: 17, right: 16, bottom: 17),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgFilterPrimary)),
                          suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(52)),
                          contentPadding: getPadding(top: 12, bottom: 12)),
                      Expanded(
                          child: Padding(
                              padding: getPadding(top: 24),
                              child: 
                              FutureBuilder(
                      future: DBHelper.database.jobpostdao.getAllJobPosts(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              //physics: const NeverScrollableScrollPhysics(),
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
                
                                  )
                                  
                                  ),
                      
                    
                    ]))
                    )
                    );
  }

 
  onTapRowesther(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.chatScreen);
  }


  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }
}
