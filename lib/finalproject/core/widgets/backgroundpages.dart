import 'package:flutter/material.dart';

Widget mainBackground(BuildContext context){
  return  Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/background.jpeg',
                      ),
                    ),
                  ),
                  height: 300.0,
                ),
                Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.0),
                            Colors.black,
                          ],
                          stops: [
                            0.0,
                            1.0
                          ])),
                ),
              ]),
            );
           
           
}