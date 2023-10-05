import 'package:flutter/material.dart';
import 'package:store_app/productModel.dart';

class Details extends StatelessWidget {
  late ProductModel pm;
  Details({super.key, required this.pm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 40,right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      pm.thumbnail.toString(),
                      fit: BoxFit.fill,
                    ),
                  )),
              Text(pm.brand.toString()),
              Text(pm.description.toString())
            ],
          ),
        ),
      ),
    );
  }
}
