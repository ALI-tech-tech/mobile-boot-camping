import 'package:flutter/material.dart';
import 'package:flutter_practis/restructureproject/core/repositories/local_repo.dart';
import 'package:flutter_practis/restructureproject/core/viewsmodel/products_view_model.dart';

class FavoriteProductsScreen extends StatefulWidget {
  const FavoriteProductsScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteProductsScreen> createState() => _FavoriteProductsScreenState();
}

class _FavoriteProductsScreenState extends State<FavoriteProductsScreen> {
  ProductViewModel pVM=ProductViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(future:pVM.fetchProducts(LocalProductsRepo()) ,builder: (ctx,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          if(snapshot.hasData){
            return ListView.builder(itemBuilder:(ctx,index){
              return Card(child: Column(children: [
                Image.network(snapshot.data![index].thumbnail!),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Text(snapshot.data![index].price.toString()),
                  Icon(Icons.favorite_border)
                ],)
              ],),);
            },itemCount: snapshot.data!.length,);

          }
          else {
            return Center(child: Text("No data avilable at this time"),);
          }
        }
        else
          return Center(child: CircularProgressIndicator(),);
      },)
    );
  }
}
