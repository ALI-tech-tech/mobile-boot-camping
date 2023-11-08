// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
// import 'package:flutter_practis/TalkahApp/core/Theme/app_colors.dart';
// import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
// import 'package:flutter_practis/TalkahApp/core/widget/containerbarclippath.dart';
// import 'package:flutter_practis/TalkahApp/core/widget/iconappbar.dart';
// import 'package:flutter_practis/TalkahApp/core/widget/mycard.dart';
// import 'package:flutter_practis/TalkahApp/routes/app_routs.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   ScrollController _scrollController = ScrollController();

// double _scrollPosition = 0;
// _scrollListener() {
//   setState(() {
//     _scrollPosition = _scrollController.position.pixels;
//   });
// }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _scrollController.addListener(_scrollListener);

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//        appBar: AppBar(
//         toolbarHeight: 80,

// actions: [iconAppbar(bkground: Colors.white.withOpacity(0.3), context: context, widget: Icon(Icons.notifications_none_rounded, size: 30,color: Colors.white,), callback: (){
//   Navigator.pushNamed(context,AppRoutes.notificationScreen );
// })],
// title:_scrollPosition == 0 ?
// AnimatedOpacity(
//         opacity:  1 ,
//         duration: const Duration(milliseconds: 800),
//         child:  ListTile(title: Text("اهلا وسهلا بك , نورتنا 😍", style: App_TextStyle.appbarheader,),
// subtitle: Text("تسجيل الدخول",style: App_TextStyle.appbarbody,)))

// :AnimatedOpacity(
//         opacity:  1,
//         duration: const Duration(milliseconds: 1000),
//         child: Text("الرئيسية"),

// ),),

//         body:
//          SingleChildScrollView(
//         controller: _scrollController,
//         child: Column(
//           children: <Widget>[
//             Stack(
//               children: [
//                 ContainerBarClip(context,150),
//                 SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             padding: EdgeInsets.only(top: 40),
//                             child: CarouselSlider(
//                               options: CarouselOptions(
//                                 height: 170,
//                                 autoPlay: true,
//                                 autoPlayInterval: Duration(seconds: 3),
//                               ),
//                               items: [
//                                 "img_thumbnailimage_35.png",
//                                 "img_thumbnailimage_34.png",
//                                 "img_thumbnailimage_33.png"
//                               ].map((i) {
//                                 return Builder(
//                                   builder: (BuildContext context) {
//                                     return InkWell(
//                                       onTap: (){
//                                         //Navigator.pushNamed(context, MovieVideopage.rout);
//                                       },
//                                       child: Container(
//                                           width:
//                                               MediaQuery.of(context).size.width /
//                                                   1.5,

//                                           // margin: EdgeInsets.symmetric(horizontal: 5.0),
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                               image: DecorationImage(
//                                                   image: AssetImage(
//                                                       "assets/images/talka/images/${i}"),
//                                                   fit: BoxFit.fill)),
//                                           child: Text(
//                                             '',
//                                           )),
//                                     );
//                                   },
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 SizedBox(height: 20,),

//               ],
//             ),
//            // MyCard(400, 200, 50, 90),
//           ],
//         ),
//       ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/TalkahApp/core/constant/App_image.dart';
import 'package:flutter_practis/TalkahApp/core/utils/App_images.dart';
import 'package:flutter_practis/TalkahApp/core/widget/containerbarclippath.dart';
import 'package:flutter_practis/TalkahApp/core/widget/iconappbar.dart';
import 'package:flutter_practis/TalkahApp/routes/app_routs.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.9),
          appBar: 
          AppBar(
            flexibleSpace: Container(
              width: getWidth(context),
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(appbarBKImagetop), fit: BoxFit.fill)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: getWidth(context) / 1.3,
                      child: _scrollPosition > 25
                          ? appbaranim1(0, 1, 500)
                          : appbaranim1(1, 0, 800)),
                  iconAppbar(
                      bkground: Colors.white.withOpacity(0.3),
                      context: context,
                      widget: Container(
                          child: SvgPicture.asset(
                              "assets/talka/icons/notification.svg")),
                      callback: () {
                        Navigator.pushNamed(
                            context, AppRoutes.notificationScreen);
                      }),
                ],
              ),
            ),
            elevation: 0,
          ),
          
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              child: Column(
                children: [
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
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "توصيل الطعام",
                                    style: App_TextStyle.BodyHeadr
                                  ),
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                      "لاتشيل هم الجوعززطعام,شراب ,وجبات سريعة, اكل بيت , أيسكريم ...كلو موجود ومن افخم الاماكن",
                                      style: App_TextStyle.Bodycontent.copyWith(color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/talka/images/food.png"))),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          StaggeredGrid.count(
                            
                            crossAxisCount: 4,
                            mainAxisSpacing: 8,
                            children: [
                              StaggeredGridTile.count(

                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 2.8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    margin:
                                        EdgeInsets.only(right: 10, left: 10,),
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "طلقة بلاس",
                                            style:App_TextStyle.BodyHeadr,
                                          ),
                                          Text(
                                            "توصيل سريع لأي شيء من والى أي مكان",
                                            style:  App_TextStyle.Bodycontent.copyWith(color: Colors.grey),
                                          ),
                                          Container(
                                            
                                            width: 100,
                                            height: 150,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/talka/images/dron.png"))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    margin:
                                        EdgeInsets.only(right: 10, left: 10),
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "متاجر",
                                            style: App_TextStyle.BodyHeadr,
                                          ),
                                          Text(
                                            "تسوق واشتر كل احتياجاتك من أضحم المحلات بضغطة زر",
                                            style:  App_TextStyle.Bodycontent.copyWith(color: Colors.grey),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                              width: 100,
                                              height: 115,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/talka/images/phone.png"))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 2.8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    margin:
                                        EdgeInsets.only(right: 10, left: 10),
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "دوائي",
                                            style: App_TextStyle.BodyHeadr,
                                          ),
                                          Text(
                                            "تسوق واشتر كل احتياجاتك من أضحم المحلات بضغطة زر",
                                            style:  App_TextStyle.Bodycontent.copyWith(color: Colors.grey),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: 
                                             Container(
                                              width: 100,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/talka/images/doa.jpg"))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    margin: EdgeInsets.only(
                                        right: 10, left: 10, bottom: 20),
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "وصلني",
                                            style: App_TextStyle.BodyHeadr,
                                          ),
                                          Text(
                                            "تسوق واشتر كل احتياجاتك من أضحم المحلات بضغطة زر",
                                            style:  App_TextStyle.Bodycontent.copyWith(color: Colors.grey),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                              margin: EdgeInsets.only(left: 8),
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/talka/images/car.png"))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        ),
      ),
    );
  }

  appbaranim1(double first, double second, int duration) {
    return Stack(
      children: [
        AnimatedOpacity(
            opacity: first,
            duration: Duration(milliseconds: duration),
            child: ListTile(
                title: Text(
                  "اهلا وسهلا بك , نورتنا 😍",
                  style: App_TextStyle.appbarheader,
                ),
                subtitle: Text(
                  "تسجيل الدخول",
                  style: App_TextStyle.appbarbody,
                ))),
        AnimatedOpacity(
          opacity: second,
          duration: Duration(milliseconds: (duration)),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "الرئيسية",
              style: App_TextStyle.appbarheader,
            ),
          ),
        ),
      ],
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 50);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
///////////
///
///
///
///

