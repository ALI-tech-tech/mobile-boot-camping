import 'package:flutter/material.dart';
import 'package:store_app/productModel.dart';

class Details2 extends StatelessWidget {
  List<ProductModel> li=[];
  Details2({super.key, required this.li});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body:
      ListView.builder(
            itemCount: li.length,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  InkWell(
                    child: Container(
                      child: ListTile(
                        title:
                            Text(li[index].brand.toString()),
                        subtitle: Text(
                            li[index].description.toString()),
                        trailing: Container(
                          child: Card(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              li[index].thumbnail.toString(),
                              fit: BoxFit.fill,
                            ),
                          )),
                          width: 50,
                          height: 50,
                          
                        ),
                      ),
                    ),
                    // onTap: () {
                    //   num.add(pController.products[index]);
                    //   if (num.length==3) {
                    //     Navigator.pushNamed(context, "/details2",
                    //       arguments: num);
                    //   }
                    // },
                  ),
                  Divider(height: 3, color: Colors.black),
                ],
              );
            })
            
      //  SingleChildScrollView(
      //    child: Column(
      //      children: [
      //       for(int i=0;i<li.length;i++)
      //        Container(
      //           padding: EdgeInsets.only(left: 40,right: 30),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Container(
                        
      //                   child: ClipRRect(
      //                     borderRadius: BorderRadius.circular(10),
      //                     child: Image.network(
      //                       li[i].thumbnail.toString(),
      //                       fit: BoxFit.fill,
      //                     ),
      //                   )),
      //               Text(li[i].brand.toString()),
      //               Text(li[i].description.toString())
      //             ],
      //           ),
      //         ),
      //      ],
      //    ),
      //  ),
      
      
      
      
      )
    ;
  }
}
