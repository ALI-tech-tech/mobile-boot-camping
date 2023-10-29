import 'package:flutter/material.dart';
import 'package:flutter_practis/day42/controller/PostControoler.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  late PostController pc;
  @override
  void initState() {
    super.initState();
    pc=PostController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder(
        future: pc.fetchPosts(),
        builder: (ctx,snab){
          if (snab.connectionState==ConnectionState.done) {
          if (snab.hasData) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return Container(
               
                margin: EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Center(child: ElevatedButton(onPressed: (){}, child: Text("Post${index+1}"))),
                    Text(snab.data![index].title.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(snab.data![index].body.toString(), style: TextStyle( color: Colors.grey),),
                  ],
                ));
            }, 
            separatorBuilder: (context, index) => Divider(),
             itemCount: snab.data!.length);
          }
          }
          return CircularProgressIndicator();
        })
     );
  }
}