import 'package:flutter/material.dart';
import 'package:flutter_practis/day33/ProductController.dart';

import 'card.dart';
import 'product.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductController pc = ProductController();
  //static List<Product> selctedli = [];

  @override
  void initState() {
    super.initState();
    pc.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => <PopupMenuItem<Widget>>[
              PopupMenuItem<Widget>(
                  child: InkWell(
                      onTap: () async {
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (cx)=>Cardd(),));
                        final bool? shouldRefresh = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (cx) => Cardd(),
                            ));
                        if (shouldRefresh!) {
                          setState(() {});
                          
                        }
                      },
                      child: Text('View all'))),
              PopupMenuItem<Widget>(
                  onTap: () {
                    pc.removeallselct();
                  },
                  child:  Text('Clear All')),
              PopupMenuItem<Widget>(
                  child: InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Text('Refresh'))),
            ],
          )
        ],
      ),
      body: ListView.builder(
          itemCount: ProductController.li.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () {
                ProductController.li[index].select =
                    !ProductController.li[index].select;
                pc.addselcte(p: ProductController.li[index]);
                setState(() {});
              },
              child: ListTile(
                title: Text(ProductController.li[index].name!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ProductController.li[index].description!),
                    Text(ProductController.li[index].Price!),
                  ],
                ),
                trailing: ProductController.selctedli
                        .contains(ProductController.li[index])
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : null,
              ),
            );
          }),
    );
  }
}
