import 'package:flutter/material.dart';
import 'package:postwithlaravelapi/view/showpost.dart';
import 'package:postwithlaravelapi/viewmodel/postviewmodel.dart';

import 'addpost.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostViewmodel pVM=PostViewmodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: [
          IconButton(onPressed: ()async{
            bool? v= await Navigator.push(context, MaterialPageRoute(builder: (context) {
              
              return PostForm();
            } ,
            
            ));
            if (v!=null && v) {
              setState(() {
                
              });
            }
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: FutureBuilder(
          future: pVM.getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: pVM.allPost.length,
                itemBuilder:(context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ShowPost(post: snapshot.data![index],);
                    },));
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(snapshot.data![index].title!),
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return PostForm(post:  snapshot.data![index]);
                        },));
                      }, icon: Icon(Icons.edit))
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(snapshot.data![index].body!),
                      IconButton(onPressed: (){
                        pVM.deletepost(snapshot.data![index]);
                        setState(() {
                          
                        });
                      }, icon: Icon(Icons.delete))
                    ],
                  ),

                );
              }, );
            }
            return CircularProgressIndicator();
          },),
      ),
    );
  }
}