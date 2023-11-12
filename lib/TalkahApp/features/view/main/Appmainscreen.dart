import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/features/view/cart/acart.dart';
import 'package:flutter_practis/TalkahApp/core/widget/bksvg.dart';
import 'package:flutter_practis/TalkahApp/features/view/Home/Homescreen.dart';
import 'package:flutter_practis/TalkahApp/features/view/account/account_screnn.dart';
import 'package:flutter_practis/TalkahApp/features/view/favorite/favoritescreen.dart';
import 'package:flutter_practis/TalkahApp/features/view/order/myorder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class AppMainPage extends StatefulWidget {
  @override
  _AppMainPageState createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage>
    with TickerProviderStateMixin {
  List<String> lables = ["الرئيسية", "طلباتي", "السلة", "المفضلة", "الحساب"];
  List<String> lottiname = [
    "home.json",
    "cart.json",
    "orders.json",
    "favorites.json",
    "profile.json"
  ];
  List<AnimationController> Controllers = [];
  int naviBar = 0;
  bool v = false;
  bool r = false;
  void playAnimation(int index) {
    Controllers[index].forward();
  }

  void pauseAnimation(int index) {
    Controllers[index].reset();
  }

  final List<Widget> pages = [
    HomePage(),
    MyOrders(),
    Cart(),
    FavoriteScreen(),
    AccountScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < lottiname.length; i++) {
      Controllers.add(AnimationController(
          vsync: this, duration: Duration(milliseconds: 500)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: pages[naviBar],
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          //shape:CircleBorder(eccentricity: 5),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AnimatedContainer(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  curve: Curves.bounceInOut,
                  height: 1200,
                  duration: Duration(seconds: 13),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child:
                     Container(
                      margin: EdgeInsets.all(10),
                      child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "الدعم الفني",
                                style: App_TextStyle.BodyHeadr,
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.cancel_outlined)),
                            ],
                          ),
                          Text(
                            "يمكنك التواصل معنا عن طريق أحد الطرق التالية",
                            style: App_TextStyle.Bodycontent,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green.withBlue(180),
                                borderRadius: BorderRadius.circular(8)),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListTile(
                                leading: bksvg(
                                    SvgPicture.asset(
                                        "assets/talka/icons/whatsapp.svg"),
                                    50,
                                    50,
                                    10),
                                title: Text(
                                  "خدمة العملاء واتساب",
                                  style: App_TextStyle.Bodycontent,
                                ),
                                trailing: Icon(Icons.arrow_right),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green.withBlue(180),
                                borderRadius: BorderRadius.circular(8)),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListTile(
                                leading: bksvg(
                                    SvgPicture.asset(
                                        "assets/talka/icons/whatsapp.svg"),
                                    50,
                                    50,
                                    10),
                                title: Text(
                                  "خدمة العملاء واتساب",
                                  style: App_TextStyle.Bodycontent,
                                ),
                                trailing: Icon(Icons.arrow_right),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8)),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListTile(
                                leading: Icon(Icons.arrow_left),
                                title: Text(
                                  "خدمة العملاء واتساب",
                                  style: App_TextStyle.Bodycontent,
                                ),
                                trailing: Icon(Icons.arrow_right),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8)),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListTile(
                                leading: Icon(Icons.arrow_left),
                                title: Text(
                                  "خدمة العملاء واتساب",
                                  style: App_TextStyle.Bodycontent,
                                ),
                                trailing: Icon(Icons.arrow_right),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8)),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListTile(
                                leading: Icon(Icons.arrow_left),
                                title: Text(
                                  "خدمة العملاء واتساب",
                                  style: App_TextStyle.Bodycontent,
                                ),
                                trailing: Icon(Icons.arrow_right),
                              ),
                            ),
                          )
                        ],
                      ),
                    
                    ),
                  ),
                );
              },
            );
          
          },
          backgroundColor: Colors.blue[800],
          child: SvgPicture.asset(
            "assets/talka/icons/call-calling.svg",
            height: 30,
            width: 30,
            fit: BoxFit.fill,
            colorFilter: ColorFilter.linearToSrgbGamma(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            onTap: (value) {
              for (var i = 0; i < lottiname.length; i++) {
                pauseAnimation(i);
              }

              playAnimation(value);
              setState(() {
                naviBar = value;
              });
            },
            selectedLabelStyle: App_TextStyle.Bodycontent,
            unselectedLabelStyle:
                App_TextStyle.Bodycontent.copyWith(fontSize: 13),
            currentIndex: naviBar,
            selectedItemColor: const Color.fromARGB(255, 5, 53, 91),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            items: List.generate(
              lottiname.length,
              (index) => BottomNavigationBarItem(
                label: lables[index],
                icon: Lottie.asset(
                    'assets/talka/animations/${lottiname[index]}',
                    repeat: false, onLoaded: (p) {
                  if (p.name == "home") {
                    playAnimation(0);
                  }
                },
                    controller: Controllers[index],
                    width: 50,
                    height: 40,
                    fit: BoxFit.fill),
              ),
            )),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
