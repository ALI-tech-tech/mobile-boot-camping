import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/Textstyle.dart';
import 'package:flutter_practis/finalproject/core/widgets/alert.dart';
import 'package:flutter_practis/finalproject/core/widgets/categoryicon.dart';
import 'package:flutter_practis/finalproject/core/widgets/drawer.dart';
import 'package:flutter_practis/finalproject/core/widgets/picwithdetails.dart';
import 'package:flutter_practis/finalproject/features/view/movievideopage.dart';

import 'package:flutter_svg/flutter_svg.dart';

class MovieHomepage extends StatefulWidget {
  static String rout = "/moviehome";
  const MovieHomepage({super.key});

  @override
  State<MovieHomepage> createState() => _MovieHomepageState();
}

class _MovieHomepageState extends State<MovieHomepage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> category = ["Movie", "Series", "KidsContent", "Drama","Action","Romantic"];
  List<IconData> caticon = [
    Icons.movie,
    Icons.money,
    Icons.child_care,
    Icons.masks_sharp,
    Icons.sports_gymnastics_sharp,
    Icons.favorite_sharp
  ];

   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await alertmovie(context);
    
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          drawer: CustomDrawer(),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            toolbarHeight: 30,
            leading: InkWell(
              onTap: () => _scaffoldKey.currentState!.openDrawer(),
              child: Icon(
                Icons.menu_open_outlined,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "TRENDING",
                  style: TextStyleTheme.headertext(),
                ),
                Text(
                  "NEWEST",
                  style: TextStyleTheme.headertext(),
                ),
                Text(
                  "FORYOU",
                  style: TextStyleTheme.headertext(),
                ),
                Text(
                  "POPULAR",
                  style: TextStyleTheme.headertext(),
                ),
              ],
            ),
            actions: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/ali.JPG"),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/img_thumbnailimage_160x312.png"),
                            fit: BoxFit.cover)),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 40),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 170,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 2),
                              ),
                              items: [
                                "img_thumbnailimage_35.png",
                                "img_thumbnailimage_34.png",
                                "img_thumbnailimage_33.png"
                              ].map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, MovieVideopage.rout);
                                      },
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  1.5,
                                    
                                          // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/${i}"),
                                                  fit: BoxFit.fill)),
                                          child: Text(
                                            '',
                                          )),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 3.5,
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 45, 45),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      child: ListView(
                      
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            category.length,
                            (index) => category_icon(
                                icon: caticon[index], title: category[index]),
                          ),
                        
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                color: Color.fromARGB(255, 45, 45, 45),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, left: 8.0, right: 8.0, bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("TRINDING IN VIMU",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text("SEEALL",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            PicWithDetails(
                                image:
                                    "assets/images/img_thumbnailimage_139x99.png",
                                rate: "4.3"),
                            PicWithDetails(
                                image:
                                    "assets/images/img_thumbnailimage_133x99.png",
                                rate: "5.2"),
                            PicWithDetails(
                                image:
                                    "assets/images/img_thumbnailimage_120x120.png",
                                rate: "3.4"),
                            PicWithDetails(
                                image: "assets/images/img_thumbnailimage_1.png",
                                rate: "3.4"),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color.fromARGB(255, 45, 45, 45),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, left: 8.0, right: 8.0, bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("TRINDING IN VIMU",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text("SEEALL",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            PicWithDetails(
                                image: "assets/images/img_thumbnailimage_2.png",
                                rate: "4.3"),
                            PicWithDetails(
                                image:
                                    "assets/images/img_thumbnailimage_133x99.png",
                                rate: "5.2"),
                            PicWithDetails(
                                image:
                                    "assets/images/img_thumbnailimage_120x120.png",
                                rate: "3.4"),
                            PicWithDetails(
                                image: "assets/images/ali.JPG", rate: "3.4"),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color.fromARGB(255, 45, 45, 45),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, left: 8.0, right: 8.0, bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("TRINDING IN VIMU",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text("SEEALL",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            PicWithDetails(
                                image:
                                    "assets/images/img_thumbnailimage_139x99.png",
                                rate: "4.3"),
                            PicWithDetails(
                                image:
                                    "assets/images/img_thumbnailimage_133x99.png",
                                rate: "5.2"),
                            PicWithDetails(
                                image:
                                    "assets/images/img_thumbnailimage_120x120.png",
                                rate: "3.4"),
                            PicWithDetails(
                                image: "assets/images/ali.JPG", rate: "3.4"),
                          ],
                        )),
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
