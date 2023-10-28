import 'package:flutter/material.dart';


import 'package:flutter_practis/finalproject/core/widgets/backgroundpages.dart';
import 'package:flutter_practis/finalproject/core/widgets/onbordingcontent.dart';
import 'package:flutter_practis/finalproject/features/view/Categorypayment.dart';
import 'package:flutter_practis/finalproject/features/view/botomnavigatehome.dart';
import 'package:flutter_practis/finalproject/features/view/category.dart';
import 'package:flutter_practis/finalproject/features/view/createaccount.dart';
import 'package:flutter_practis/finalproject/features/view/customplane.dart';
import 'package:flutter_practis/finalproject/features/view/moviepage.dart';
import 'package:flutter_practis/finalproject/features/view/movievideopage.dart';
import 'package:flutter_practis/finalproject/features/view/otp.dart';
import 'package:flutter_practis/finalproject/features/view/paymentmethod.dart';
import 'package:flutter_practis/finalproject/features/view/paymentmethodP2.dart';
import 'package:flutter_practis/finalproject/features/view/personalaccount.dart';
import 'package:flutter_practis/finalproject/features/view/signin.dart';
import 'package:flutter_practis/finalproject/features/view/start.dart';
import 'package:flutter_practis/finalproject/features/view/subscribtion.dart';
import 'package:flutter_practis/finalproject/features/view/subscriptionplan.dart';
import 'package:flutter_practis/finalproject/features/view/watchlist.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: dark,
      title: 'Movie App',
      home:HomePage(),
      routes: {
        "/home": (context) => HomePage(),
        "/startpage": (context) => StartPage(),
        "/createaccount": (context) => CreateAccount(),
        "/signin":(context) => SignIn(),
        "/moviehome":(context) => MovieHomepage(),
        "/subscriptionplan":(context) => Subscriptionplan(),
        "/customplan":(context) => CustomPlan(),
        "/paymentmethod":(context) => PaymentMethod(),
        "/paymentP2":(context) => PaymentPage(),
        "/pincode":(context) => PinCode(),
        "/categorypayment":(context) => CategoryPayment(),
        "/movievediopage":(context) => MovieVideopage(),
        "/watchlist":(context) => WatchList(),
        "/Homemoviepage":(context) => BottomNavigationBarApp(),
        "/SbScribtionPlansUser":(context) => SbScribtionPlansUser(),
        "/personalaccount":(context) => PersonalAccount(),
        "/category":(context) => Category(),
        
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            mainBackground(context),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height - 400, left: 20),
              child: PageView(
                onPageChanged: (value) {
                  if (value == 2) {
                    Future.delayed(Duration(seconds: 4)).then((value) {
                      Navigator.pushNamed(context, StartPage.rout);
                    });
                  }
                },
                controller: controller,
                children: [
                  onbordingcontent(
                      context: context,
                      icon: Icons.computer,
                      Headr: "Wach on any device",
                      Content: "Connect to using your favorite\ndevice"),
                  onbordingcontent(
                      context: context,
                      icon: Icons.computer,
                      Headr: "Unlimited EnterTainment",
                      Content: "Iam an early bird and I am a night owl"),
                  onbordingcontent(
                    context: context,
                    icon: Icons.computer,
                    Headr: "NO ANNOYING CONTRACTS",
                    Content: "Iam an early bird and I am a night owl",
                  ),
                ],
              ),
            ),
            Positioned(
                left: 50,
                top: MediaQuery.of(context).size.height - 150,
                child: SmoothPageIndicator(
                  effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                          width: 14,
                          height: 14,
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(7)),
                      dotDecoration: DotDecoration(
                          width: 12,
                          height: 12,
                          borderRadius: BorderRadius.circular(6))),
                  controller: controller,
                  count: 3,
                ))
          ],
        ),
      ),
    );
  }
}
