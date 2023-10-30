import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/day44/post.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: LoadProduct(),
            builder: (ctx, snap) {
              if (snap.connectionState == ConnectionState.done) {
                if (snap.hasData) {
                  Map<String, dynamic> cont = jsonDecode((snap.data!));
                  List<dynamic> product = cont["data"];
                  List<Post> allposts=product.map((e) => Post.fromJson(e)).toList();
                  return ListView.builder(
                      itemCount: allposts.length,
                      itemBuilder: ((context, index) {
                        return Card(

                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(allposts[index].owner!.picture!),
                                      
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5, bottom: 8,top: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [Text("${allposts[index].owner!.firstName} ${allposts[index].owner!.lastName}"), Text("${allposts[index].publishDate}")],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: NetworkImage(allposts[index].image!, ), fit: BoxFit.fill)
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${allposts[index].publishDate}"),
                                        Container(
                                          margin: EdgeInsets.only(top:10,bottom: 10),
                                          width: 200,
                                          child: Text("${allposts[index].text}", maxLines: 10, )),
                                        Row(
                                          children: List.generate(allposts[index].tags!.length, (i) => Container(
                                            margin: EdgeInsets.all(5),
                                            padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.pink,
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                                child: Text(allposts[index].tags![i]),
                                            ),),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.thumb_up),
                                            Text("${allposts[index].likes}"),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }));
                }
              }
              return CircularProgressIndicator();
            }));
  }

  Future<String?> LoadProduct() async {
    Dio d = Dio();
    const apiUrl = 'https://dummyapi.io/data/v1/post?limit=10';
    const headers = {'app-id': '653f57ce0d18c558626e3884'};
    Response<String> result =
        await d.get(apiUrl, options: Options(headers: headers));
    print(result.data);
    return result.data;
  }
}
