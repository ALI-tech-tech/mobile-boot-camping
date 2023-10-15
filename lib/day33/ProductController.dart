import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_practis/day33/product.dart';

class ProductController {
  static List<Product> li=[];
  static List<Product> selctedli = [];

  addproduct({required String name,required String descrip,required String price}){
    li.add(Product(name: name, description: descrip, Price: price));
  }
  addselcte({required Product p}){
    selctedli.add(p);
  }

  remove({required String name})
 {
  li.remove(li.firstWhere((element) => element.name==name));
 } 
  removeselect({required String name})
 {
  Product p=li.firstWhere((element) => element.name==name);
  p.select=false;
  selctedli.remove(p);

 } 
removeallselct(){
 var lp=selctedli;
 if (!selctedli.isEmpty) {
 for (var i = 0; i <= lp.length; i++) {
  li.firstWhere((element) => element.name==lp[i].name).select=false;
   selctedli.remove(lp[i]);

 }
 }
 
}
 getdata(){
  for (var i = 0; i <20; i++) {
    addproduct(name: "Product ${i+1}", descrip: "descrip ${i+1}", price: (Random().nextInt(100)+10).toString());
  }
 }

 totall(){
  int sum=0;
   selctedli.forEach((element) {
    sum+=int.parse(element.Price!);
   }
   
   );
   return sum;
 }
}