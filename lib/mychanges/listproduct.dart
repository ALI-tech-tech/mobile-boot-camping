import 'package:flutter/material.dart';
import 'package:store_app/productController.dart';

class ListProduct extends StatelessWidget {
  ListProduct({Key? key}) : super(key: key);
  ProductController pController = ProductController();
  @override
  Widget build(BuildContext context) {
    pController.getAllProducts();
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: ListView.builder(
            itemCount: pController.products.length,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  InkWell(
                    child: Container(
                      child: ListTile(
                        title:
                            Text(pController.products[index].brand.toString()),
                        subtitle: Text(
                            pController.products[index].description.toString()),
                        trailing: Container(
                          child: Card(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              pController.products[index].thumbnail.toString(),
                              fit: BoxFit.fill,
                            ),
                          )),
                          width: 50,
                          height: 50,
                          
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/details",
                          arguments: pController.products[index]);
                    },
                  ),
                  Divider(height: 3, color: Colors.black),
                ],
              );
            }));
  }
}
