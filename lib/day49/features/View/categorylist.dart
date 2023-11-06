import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/day49/features/View/productlist.dart';
import 'package:flutter_practis/day49/features/Viewmodel/viewmodelproduct.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  ViewModelProduct vm = ViewModelProduct();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm.getCategries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: vm.getCategries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList(category: snapshot.data![index]),));
                    },
                    child: Container(
                      width: getWidth(context)-30,
                      height: 50,
                      margin: EdgeInsets.only(left:10, top: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text(snapshot.data![index])),
                    ),
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
