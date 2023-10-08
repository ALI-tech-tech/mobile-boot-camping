import 'package:flutter/material.dart';
import 'package:task2/productModel.dart';

import 'productController.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  ProductController pController = ProductController();
  late List<ProductModel> li;
  @override
  Widget build(BuildContext context) {
    li = [];
    pController.getAllProducts();
    return 
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Products"),
      ),
      drawer: Drawer(
        
          child: Column(
        children: [
          UserAccountsDrawerHeader(
           decoration: BoxDecoration(
            color: Colors.teal
           ),
            currentAccountPicture: CircleAvatar(
              
              backgroundImage: AssetImage("assets/images/logo.jpg"),
            ),
            accountEmail: Text("mokhtar.ghaleb@gmail.com"),
            accountName: Text("Mokhtar Ghaleb"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home Page"),
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Page not found"),
            onTap: () {
              Navigator.pushNamed(context, "/notfound");
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Cart"),
            onTap: () {
              Navigator.pushNamed(context, "/cart", arguments: li);
            },
          )
        ],
      )),
      body: ListView.builder(
          itemCount: pController.products.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              child: Card(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: Image.network(
                              "${pController.products[index].thumbnail}"),
                        ),
                        Positioned(
                            left: 320,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Text(
                                  "${pController.products[index].discountPercentage}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ))
                      ],
                    ),
                    ListTile(
                      title: Text("${pController.products[index].title}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text("${pController.products[index].price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent)),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${pController.products[index].brand}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          InkWell(child: Text("More details..."),onTap:(){
                            Navigator.pushNamed((context), "/details",arguments: pController.products[index]);
                          },)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                li.add(pController.products[index]);
              },
            );
          }),
    );
 
  }
}
