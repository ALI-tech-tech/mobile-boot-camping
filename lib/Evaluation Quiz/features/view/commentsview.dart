// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_practis/Evaluation%20Quiz/features/viewmodel/viwmodelblog.dart';

import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';


class ComentList extends StatefulWidget {
   String blog;
  ComentList({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  State<ComentList> createState() => _ComentListState();
}

class _ComentListState extends State<ComentList> {
  ViewModelBlog vm = ViewModelBlog();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm.getComent(widget.blog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: vm.getComent(widget.blog),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) { 
                  return Container(
                    width: getWidth(context)-20,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.green.withBlue(180),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: ListTile(
                          title: Text(snapshot.data![index].content.toString()),
                        ),
                      ),
                      

                      Container(
                        width: getWidth(context)-20,
                        child: Text(snapshot.data![index].createdAt.toString(), maxLines: 5,),
                      )
                    
                    ],
                  )
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
