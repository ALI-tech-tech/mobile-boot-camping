import 'package:blogappwithrealapi/core/viewmodel/artical_viewmodel.dart';
import 'package:blogappwithrealapi/helpers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    ArticalViewModel aVM=Provider.of<ArticalViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Article"),
      ),
      body: Container(

        padding: EdgeInsets.all(10),
        child: aVM.allarticle.length==0? 
        Center(child:  Text("No thing to show"),)
        :ListView.builder(
          itemCount: aVM.allarticle.length,
          itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.pushNamed(context,AppRoutes.articaldetails, arguments:aVM.allarticle[index] );
              
            },
            child: Card(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(aVM.allarticle[index].title!, style: TextStyle(fontSize: 25),), 
                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width-40,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(aVM.allarticle[index].content!, maxLines: 2, style: TextStyle(fontSize: 20),),
                  )
                ],
              ),
            ),
          );
        },),
      ),
    );
  }
}