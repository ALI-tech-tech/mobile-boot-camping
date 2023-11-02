import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/app_colors.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/TalkahApp/core/widget/containerbarclippath.dart';
import 'package:flutter_practis/TalkahApp/core/widget/iconappbar.dart';
import 'package:flutter_practis/TalkahApp/core/widget/mycard.dart';
import 'package:flutter_practis/TalkahApp/routes/app_routs.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
       appBar: AppBar(
        toolbarHeight: 80,
        
        actions: [iconAppbar(bkground: Colors.white.withOpacity(0.3), context: context, widget: Icon(Icons.notifications_none_rounded, size: 30,color: Colors.white,), callback: (){
          Navigator.pushNamed(context,AppRoutes.notificationScreen );
        })],
        title:_scrollPosition == 0 ?
        AnimatedOpacity(
                opacity:  1 ,
                duration: const Duration(milliseconds: 800),
                child:  ListTile(title: Text("اهلا وسهلا بك , نورتنا 😍", style: App_TextStyle.appbarheader,),
        subtitle: Text("تسجيل الدخول",style: App_TextStyle.appbarbody,)))
        
        :AnimatedOpacity(
                opacity:  1,
                duration: const Duration(milliseconds: 1000),
                child: Text("الرئيسية"),
        
        ),),
        
        
       
        body:
         SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                ContainerBarClip(context,150),
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
                                autoPlayInterval: Duration(seconds: 3),
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
                                        //Navigator.pushNamed(context, MovieVideopage.rout);
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
                SizedBox(height: 20,),
                
              ],
            ),
           // MyCard(400, 200, 50, 90),
          ],
        ),
      ),
      ),
    );
  }
}