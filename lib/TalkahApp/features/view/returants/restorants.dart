import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/TalkahApp/core/constant/App_image.dart';
import 'package:flutter_practis/TalkahApp/core/widget/containerbarclippath.dart';
import 'package:flutter_practis/TalkahApp/core/widget/iconappbar.dart';
import 'package:flutter_practis/TalkahApp/routes/app_routs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RestorantsScreen extends StatefulWidget {
  const RestorantsScreen({super.key});

  @override
  State<RestorantsScreen> createState() => _RestorantsScreenState();
}

class _RestorantsScreenState extends State<RestorantsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                  flexibleSpace: Container(
                    width: getWidth(context),
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(appbarBKImagetop),
                            fit: BoxFit.fill)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: getWidth(context) / 1.3,
                            child: Column(
                              children: [
                                Text(
                                  "مطاعم",
                                  style: App_TextStyle.appbarheader,
                                ),
                                Text(
                                  "اضق عنوانك الافتراضي",
                                  style: App_TextStyle.appbarbody,
                                ),
                              ],
                            )),
                        iconAppbar(
                            bkground: Colors.white.withOpacity(0.3),
                            context: context,
                            widget: Container(
                                child: SvgPicture.asset(
                                    "assets/talka/icons/search.svg")),
                            callback: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.notificationScreen);
                            }),
                      ],
                    ),
                  ),
                  elevation: 0,
                ),
                body: 
                
                SingleChildScrollView(
                    // controller: _scrollController,
                    child: Container(
                        child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 100),
                    child: Stack(clipBehavior: Clip.none, children: [
                      ContainerBarClip(context, 150),
                      Positioned(
                        top: 50,
                        left: 0,
                        right: 0,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              height: 170),
                          items: List.generate(
                            4,
                            (index) => Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/talka/pic_slider.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ])
                )
                )
                
                )
                )
                );
  
  }
}
