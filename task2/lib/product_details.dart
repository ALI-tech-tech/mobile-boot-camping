import 'package:flutter/material.dart';

import 'productModel.dart';

class ProductDetails extends StatelessWidget {
  late ProductModel product;
   ProductDetails({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text(product.title.toString()),
      ),
      body: Card(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: Image.network(
                              "${product.thumbnail}"),
                        ),
                        Positioned(
                            left: 320,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "${product.discountPercentage}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ))
                      ],
                    ),
                    ListTile(
                      title: Text("${product.title}   ${product.category}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text("${product.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent)),
                      subtitle: Text(
                        "${product.brand}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(leading: Text("Rating : "),
                    title: Row(children: [
                      for(int i=0;i<product.rating!.floor();i++)
                      Icon(Icons.star,color: Colors.yellow,)
                    ],),),
                     ListTile(
                      leading: Text("Description : "),
                      title: Text("${product.description}",maxLines: 7),
                    )

                  ],
                ),
              ),
              
    );
  }
}
