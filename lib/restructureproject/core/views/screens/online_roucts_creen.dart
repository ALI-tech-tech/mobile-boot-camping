import 'package:flutter/material.dart';
import 'package:flutter_practis/restructureproject/core/repositories/local_repo.dart';
import 'package:flutter_practis/restructureproject/core/repositories/online_repo.dart';
import 'package:flutter_practis/restructureproject/core/viewsmodel/products_view_model.dart';

class OnlineProductsScreen extends StatefulWidget {
  const OnlineProductsScreen({Key? key}) : super(key: key);

  @override
  State<OnlineProductsScreen> createState() => _OnlineProductsScreenState();
}

class _OnlineProductsScreenState extends State<OnlineProductsScreen> {
  ProductViewModel pVM = ProductViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: pVM.fetchProducts(OnlineProductsRepo()),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  int result = 0;
                  snapshot.data![index].isFav = false;
                  return Card(
                    child: Column(
                      children: [
                        Image.network(snapshot.data![index].thumbnail!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(snapshot.data![index].price.toString()),
                            InkWell(
                              onTap: () async {
                                result = await pVM.addProduct(
                                    LocalProductsRepo(), snapshot.data![index]);
                                if (result > 0)
                                  snapshot.data![index].isFav = true;
                                print("the result of fave is $result");
                                setState(() {});
                              },
                              child: Icon(
                                Icons.favorite,
                                color: snapshot.data![index].isFav!
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              );
            } else {
              return Center(
                child: Text("No data avilable at this time"),
              );
            }
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}
