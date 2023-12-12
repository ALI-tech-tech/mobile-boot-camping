import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/day75/viewmodel/product_viewmodel.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  ProductViewModel pvm=Get.put(ProductViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<ProductViewModel>(
           // init:ProductViewModel(),
            builder: (x) {
            return Container(
            width: MediaQuery.of(context).size.width-50,
            height: 70,
            child: Text("Wish list: ${pvm.selected.length}"),
          );
          },) ,
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-205,
            child: GetBuilder(
              init:ProductViewModel(),
              builder: (x) {
              return ListView.builder(
                itemCount:x.allproducts.length ,
                itemBuilder: (context, index) {
                return ListTile(
                  title: Text(x.allproducts[index].name!),
                  subtitle: Text(x.allproducts[index].price!.toString()),
                  trailing:  IconButton(onPressed: (){
                    x.allproducts[index].isSelected!.value=!x.allproducts[index].isSelected!.value;
                    
                    x.addSelect(x.allproducts[index]);
                  }, icon: Icon(Icons.favorite, color: pvm.selected.contains(pvm.allproducts[index]) ?Colors.red:Colors.white,)));}
                );
              },)
            ,),
          
        ],
      ),
    );
  }
}