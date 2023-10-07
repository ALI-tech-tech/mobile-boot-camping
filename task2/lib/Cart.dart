import 'dart:ffi';

import 'package:flutter/material.dart';

import 'productModel.dart';

class Cart extends StatelessWidget {
  late List<ProductModel> products;
  double sum=0;
  var sum2;
  Cart({super.key, required this.products}) {
    products.forEach((element) {
      sum+=((element.price )!-(100/(element.discountPercentage as double))) ;
     
    });
     sum2=sum!.round() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text("Cart"),
      ),
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.jpg"),
            ),
            accountEmail: Text("alibenjhlan@gmail.com"),
            accountName: Text("Ali Ben Jahlan"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home Page"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/home");
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Login"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
        ],
      )),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "${products[index].thumbnail}",
                                      cacheHeight: 150,
                                      cacheWidth: 200,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 123,
                                    //left: 90,
                                    child: Container(
                                      //margin: EdgeInsets.all(5),
                                      width: 200,
                                      height: 27,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(141, 244, 67, 54),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10))),
                                      child: Center(
                                        child: Text(
                                          "${products[index].discountPercentage}  Discount",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              tileColor: Colors.teal[500],
                              title: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${products[index].title}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  Container(
                                    width: 80,
                                  ),
                                  //Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("-",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text(" 1 ",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text("+",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Text("${products[index].price}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              subtitle: Text(
                                "${products[index].brand}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Color : ",
                                  ),
                                  Card(
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                    ),
                                    color: Colors.red,
                                  ),
                                  Card(
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                    ),
                                    color: Colors.blue,
                                  ),
                                  Card(
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                    ),
                                    color: Colors.white,
                                  ),
                                  Card(
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                    ),
                                    color: Colors.purple,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                      // onTap: (){
                      //   Navigator.pushNamed(context, "/details",arguments: products[index]);
                      // },
                    );
                  }),
            ),
          ),
          ElevatedButton(onPressed: (){}, child: Text("Chekout => ${sum2}\$ "), style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.teal)
          ),)
        ],
      ),
    );
  }
}
