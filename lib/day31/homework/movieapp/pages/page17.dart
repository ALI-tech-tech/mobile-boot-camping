import 'package:flutter/material.dart';
import 'package:flutter_practis/day31/homework/movieapp/Theme/Textstyle.dart';

class MovieList extends StatefulWidget {
  List<String> li=["ali.JPG"];
  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Watch List",
            style: TextStyleTheme.headertext().copyWith(fontSize: 20),
          ),
          backgroundColor: Colors.grey[800],
        ),
        body: Container(
          color: Colors.grey[800],
          child: 
          widget.li.length!=0?
          Column(
            children: [
              Container(
                height: 10,
                color: Colors.grey[900],
              ),
              Row(
                children: [
                  Radio(fillColor: MaterialStatePropertyAll(Colors.white), value: 1, groupValue: 2, onChanged: (v) {}),
                  Text(
                    "ALL",
                    style: TextStyleTheme.hiheadertext(),
                  ),
                  SizedBox(
                    width: 250,
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  )
                ],
              ),
              Expanded(
                child: SizedBox(
                  //height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                      itemBuilder: (ctx, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: Container(
                              width: 80,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/${widget.li[index]}"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "HD",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      backgroundColor: Colors.yellow),
                                ),
                                Text(
                                  "Ali",
                                  style: TextStyleTheme.headertext(),
                                ),
                                Text(
                                  "Ali",
                                  style: TextStyle(color: Colors.yellow),
                                ),
                                Row(
                                  children: [
                                    for (int i = 0; i < 3; i++)
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                    for (int i = 0; i < 2; i++)
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return Divider();
                      },
                      itemCount: widget.li.length),
                ),
              ),
            ],
          )
       : Column(
         children: [
           Container(
                height: 10,
                color: Colors.grey[900],
              ),
              SizedBox(height: 170,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(Icons.menu_sharp,color: Colors.yellow,size: 80,),
                Text("Your List Is Empty",style: TextStyle(color: Colors.white,fontSize: 30),),
                Text("Your List Is Empty",style: TextStyle(color: Colors.white,fontSize: 20),),
                Text("Your List Is Empty",style: TextStyle(color: Colors.white,fontSize: 20),),
              ],
            ),
         ],
       ),
       
       
        ),

        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: 0,
        //   items: [
        //   BottomNavigationBarItem(icon: Icon(Icons.favorite_border, color: Colors.white,)), 
        //   BottomNavigationBarItem(icon: Icon(Icons.favorite_border, color: Colors.white,)), 
        //   BottomNavigationBarItem(icon: Icon(Icons.favorite_border, color: Colors.white,)), 
        // ]),
        );
  }
}
