import 'package:flutter/material.dart';
import 'package:postwithlaravelapi/model/post.dart';

class ShowPost extends StatefulWidget {
  Post? post;
   ShowPost({super.key, this.post});

  @override
  State<ShowPost> createState() => _ShowPostState();
}

class _ShowPostState extends State<ShowPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post!.title!),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Text(widget.post!.body!),
      ),
    );
  }
}