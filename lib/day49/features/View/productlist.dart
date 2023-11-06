// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/day49/features/Viewmodel/viewmodelproduct.dart';

class ProductList extends StatefulWidget {
   String category;
  ProductList({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ViewModelProduct vm = ViewModelProduct();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm.getProdutc(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: vm.getProdutc(widget.category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) { 
                  return Container(
                    width: getWidth(context)-20,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.green.withBlue(180),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: ListTile(
                          title: Text(snapshot.data![index].title.toString()),
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: NetworkImage(snapshot.data![index].image.toString()))
                        ),
                      ),

                      Container(
                        width: getWidth(context)-20,
                        child: Text(snapshot.data![index].description.toString(), maxLines: 5,),
                      )
                    
                    ],
                  )
                  );
                },
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
