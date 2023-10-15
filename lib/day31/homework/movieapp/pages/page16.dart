import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/day31/homework/movieapp/Theme/Textstyle.dart';
import 'package:flutter_practis/day31/homework/movieapp/widgets/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

import '../widgets/picwithdetails.dart';

class MovieVideopage extends StatefulWidget {
  const MovieVideopage({super.key});

  @override
  State<MovieVideopage> createState() => _MovieVideopageState();
}

class _MovieVideopageState extends State<MovieVideopage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset("assets/video/1.mp4");

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          
          
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            toolbarHeight: 30,
            
            backgroundColor: Colors.black.withOpacity(0.5),
            elevation: 0,
            title: Center(child: Text("Movie Name",style: TextStyle(color: Colors.white),))
          
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 300,
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage(
                    //             "assets/images/img_thumbnailimage_160x312.png"),
                    //         fit: BoxFit.cover)),
                    child: FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          // If the VideoPlayerController has finished initialization, use
                          // the data it provides to limit the aspect ratio of the video.
                          return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            // Use the VideoPlayer widget to display the video.
                            child: VideoPlayer(_controller),
                          );
                        } else {
                          // If the VideoPlayerController is still initializing, show a
                          // loading spinner.
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  Positioned(
                    top: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.3),
                       
                      ),
                      onPressed: () {
                        // Wrap the play or pause in a call to `setState`. This ensures the
                        // correct icon is shown.
                        setState(() {
                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                          }
                        });
                      },
                      // Display the correct icon depending on the state of the player.
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                  )
                  //Image.asset("assets/video/1.mp4"),
                ],
              ),
              Container(
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Movie Name",style: TextStyleTheme.hiheadertext(),),
                  Row(children: [Text("HD",style: TextStyle(color: Colors.black,backgroundColor: Colors.yellow),), Text("Movie cat",style: TextStyle(color: Colors.white),),],)
                ],),
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
