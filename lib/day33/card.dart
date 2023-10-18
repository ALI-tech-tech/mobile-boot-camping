import 'package:flutter/material.dart';

import 'ProductController.dart';


class Cardd extends StatefulWidget {
  //late List<Product> lis;

  @override
  State<Cardd> createState() => _CarddState();
}

class _CarddState extends State<Cardd> {
  ProductController pc = ProductController();
  @override
  Widget build(BuildContext context) {
    return
     WillPopScope(
    
      onWillPop: () async{
        Navigator.pop(context, true);
        return false;
      },
      child: 
    Scaffold(
        appBar: AppBar(
          // leading: InkWell(
          //   onTap: () {
          //     Navigator.of(context).pop(true);
          //   },
          //   child: Icon(Icons.arrow_back),
          // ),
          title: Text("Selected list"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 560,
              child: ListView.builder(
                  itemCount: ProductController.selctedli.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                        title: Text(ProductController.selctedli[index].name!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ProductController.selctedli[index].description!),
                            Text(ProductController.selctedli[index].Price!),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              pc.removeselect(
                                  name: ProductController.selctedli[index].name!);
                              setState(() {});
                            },
                            icon: Icon(Icons.remove_circle)));
                  }),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(pc.totall().toString())],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  
                  pc.removeallselct();
                  setState(() {
                    
                  });
              }, child: Text("Clear all")),
              
                ElevatedButton(onPressed: (){
    
              }, child: Text("|Confirm")),
              ],
            ),
          ],
        ),
    ),
    );
  }
}
