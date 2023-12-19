import 'package:flutter/material.dart';
import 'package:postwithlaravelapi/model/post.dart';
import 'package:postwithlaravelapi/viewmodel/postviewmodel.dart';

class PostForm extends StatefulWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  Post? post;
  PostForm({this.post}) {
    if (post != null) {
      _titleController.text = post!.title!;
      _bodyController.text = post!.body!;
    }
  }
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final _formKey = GlobalKey<FormState>();

  PostViewmodel pVM = PostViewmodel();

  @override
  void dispose() {
    widget._titleController.dispose();
    widget._bodyController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Post post = Post(
          id: widget.post?.id??0,
          title: widget._titleController.text,
          body: widget._bodyController.text);
      if (widget.post == null) {
        pVM.addpost(post);
      } else {
        pVM.updatePost(post);
      }
      widget._titleController.clear();
      widget._bodyController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Post${widget.post == null ? "add" : "update"} successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(title: Text('Add Post')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: widget._titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: widget._bodyController,
                  decoration: InputDecoration(labelText: 'Body'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a body';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(widget.post == null ? 'Add Post' : 'Update post'),
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context, true);
        return true;
      },
    );
  }
}
