import 'package:flutter/material.dart';

class PicWithDetails extends StatefulWidget {
  String image;
  String rate;
  PicWithDetails({super.key, required this.image, required this.rate});

  @override
  State<PicWithDetails> createState() => _PicWithDetailsState();
}

class _PicWithDetailsState extends State<PicWithDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(
              left: 10,
            ),
            width: 130,
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.image), fit: BoxFit.fill)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "HD",
                            style: TextStyle(
                                color: Colors.black,
                                backgroundColor: Colors.yellow),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                widget.rate,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MovieName",
                style: TextStyle(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.watch_later_outlined,size: 12,), Text(" 01:30:21",style: TextStyle(color: Colors.amber, fontSize: 10),),SizedBox(width: 55,), Icon(Icons.favorite_border,color: Colors.white,)],
              )
            ],
          ),
        ),
      ],
    );
  }
}
