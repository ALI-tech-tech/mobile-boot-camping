import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/constant/App_image.dart';
import 'package:flutter_practis/TalkahApp/core/widget/custom_arrow_back.dart';
import 'package:flutter_practis/TalkahApp/core/widget/custom_bottom_sheet_filter_loc.dart';
import 'package:flutter_practis/TalkahApp/core/widget/custom_container_shop.dart';
import 'package:flutter_practis/TalkahApp/core/widget/custom_type_button.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ShopsPage extends StatefulWidget {
  const ShopsPage({super.key});

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = true;
  int indexof=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffdf6f7fb),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              toolbarHeight: 92,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(children: [
                  Image(
                      image: AssetImage(
                          appbarBKImagetop)),
                  Positioned(
                    top: 23,
                    right: 5,
                    child: CustomArrowBack(),
                  ),
                  Positioned(
                    top: 23,
                    right: MediaQuery.of(context).size.width / 3.2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("مطاعم",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffdffffff),
                                  fontWeight: FontWeight.w400)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "أضف عنوانك الإفتراضي ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 15,
                              )
                            ],
                          )
                        ]),
                  ),
                  Positioned(
                    top: 23,
                    left: 20,
                    child: InkWell(
                      onTap: () {

                        setState(() {});
                      },
                      child: Container(
                        height: 45,
                        width: 47,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                            child: SvgPicture.asset(
                          "assets/talka/icons/search.svg",
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(children: [
                Image(
                    image: AssetImage(
                        appbarBKImagebottom)),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  //child: 
                  // CarouselSlider(
                  //   items: MainPage.images
                  //       .map((e) => ClipRRect(
                  //           borderRadius: BorderRadius.circular(10),
                  //           child: Image.asset(
                  //             e,
                  //             fit: BoxFit.cover,
                  //             height: 200,
                  //             width: 315,
                  //           )))
                  //       .toList(),
                  //   options: CarouselOptions(
                  //     height: 180,
                  //     autoPlay: true,
                  //     autoPlayInterval: const Duration(
                  //       seconds: 4,
                  //     ),
                  //   ),
                  // ),
                )
              ]),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20,right: 10,left: 10),
                  child: Container(
                    color: Color(0xffdf6f7fb),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(children: [
                                  for (int i = 0; i < 10; i++)
                                    InkWell(
                                        onTap: () {
                                          indexof = i;
                                          setState(() {

                                          });
                                        },
                                        child: CustomTypeButton(
                                          image: "assets/images/ali.JPG",
                                            title: "مطاعم",
                                            width: 150, height: 50, redus: 23, color: indexof == i?Color(0xffd245389):Colors.white,colorTxt: indexof == i?Colors.white:Color(0xffd484e5a),)),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text("جميع المطاعم",style: TextStyle(color: Color(0xffd484e5a),fontSize: 20,),),
                            InkWell(onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return CustomBottomSheetFilter();
                                },
                              );
                            },child: Container(padding: EdgeInsets.only(right: 15,left: 15),width: 150,height: 40,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("الاحدث إضافة",style: TextStyle(fontSize: 14,color: Color(0xffd484e5a).withOpacity(0.5)),),Icon(Icons.arrow_drop_down_outlined,color: Color(0xffd484e5a).withOpacity(0.5),size: 25,)]),))
                          ]),
                        ),
                        for(int i=0;i<10;i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: InkWell(onTap: () {
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return InfoShopPage();
                            //   },
                            // ));
                          },child: CustomContainerShop(title: "مطعم الخريف", 
                          loc: "شارع الستين - جسر مذبح",
                           rate: "0.0", distance: "0.0", 
                           time: "40 - 60", 
                           image: "assets/talka/pic_slider.png",width: double.infinity,)),
                        )
                      ],
                    ),
                  ),
                );
              }, childCount: 1),
            ),
          ],
        ),
      ),
    ));
  }
}
