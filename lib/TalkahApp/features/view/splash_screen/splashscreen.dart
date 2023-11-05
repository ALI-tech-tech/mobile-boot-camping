import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  FlutterGifController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller= FlutterGifController(vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        
        Center(child:GifImage(
         controller: controller!,
         image: AssetImage("assets/talka/animations/splash-screen-logo.gif", ),
         
    )
         ),
      ],
    );
  }
}