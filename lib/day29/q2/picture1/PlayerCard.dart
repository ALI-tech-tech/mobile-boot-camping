import 'package:flutter/material.dart';

class PlayCard extends StatelessWidget {
  const PlayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Stack(
                          children: [
                            Card(
                                color: Colors.pink,
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.asset(
                                      "assets/images/6.jpeg",
                                      width: 900,
                                      fit: BoxFit.fill,
                                      
                                    ))),
                            Positioned(
                              top: 25,
                              left: 150,
                                child: Container(
                              child: ClipRRect(
        
                                child: Image.asset(
                                  "assets/images/4.png",
                                  cacheHeight: 200,
                                  cacheWidth: 150,
                                ),
                              ),
                            )),
                            Positioned(
                              top: 10,
                              left: 8,
                              child: Container(
                                child: Row(children: [
                                  Icon(Icons.star),
                                  Text("4.5"),
                                  Text(" .jesrsy 1"),
                                  
                                  
                                ]),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 270,
                              child: Text("today")),
                            Positioned(
                                top: 40,
                                left: 8,
                                child: Text(
                                  "ALi Ali",
                                  style: TextStyle(fontSize: 40),
                                )),
                            Positioned(
                                top: 85,
                                left: 8,
                                child: Text(
                                  "ALi Ali",
                                  style: TextStyle(
                                      fontSize: 15,),
                                )),
                            Positioned(
                                top: 160,
                                left: 30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/2.jpg",
                                      cacheHeight: 20,
                                      cacheWidth: 20,
                                    ),
                                    Icon(Icons.arrow_forward),
                                    Image.asset(
                                      "assets/images/3.jpg",
                                      cacheHeight: 20,
                                      cacheWidth: 20,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    );
                  })),
        ),
      ),
    ]);
  }
}
