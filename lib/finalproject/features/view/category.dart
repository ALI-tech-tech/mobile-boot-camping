import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/categoryicon.dart';
import 'package:flutter_practis/finalproject/core/widgets/categoryunit.dart';

class Category extends StatefulWidget {
  static String rout="/category";
  List<String> li=["ali.JPG"];
   Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Category"),
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: 15,
          ),
          color: Color.fromARGB(255, 45, 45, 45),
          margin: EdgeInsets.only(top: 5),
          child: Column(
            children: [
               Container(
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
                        children: 
                        List.generate(
                            category.length,
                            (index) => category_icon(
                                icon: caticon[index], title: category[index]),
                          ),
                        
                      ),
                    ),
                 Divider(),
                 Expanded(
                child: SizedBox(
                  //height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                      itemBuilder: (ctx, index) {
                        return 
                        CatergoryUnit(img: widget.li[0]);
                        
                      
                      },
                      separatorBuilder: (ctx, index) {
                        return Divider();
                      },
                      itemCount: widget.li.length+5),
                ),
              ),
            ],
          ),
        ));
  }
}
