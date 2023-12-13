import 'package:blogappwithrealapi/core/model/comment.dart';
import 'package:blogappwithrealapi/core/viewmodel/comment_view_model.dart';
import 'package:blogappwithrealapi/helpers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/user_viewmodel.dart';

class AddComment extends StatelessWidget {
  

  final _formKey = GlobalKey<FormState>();
  int? articleId;
  String? comment;

  @override
  Widget build(BuildContext context) {
    UserViewModel uVM=Provider.of<UserViewModel>(context);
    CommentViewModel cVM=Provider.of<CommentViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Article ID',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an article ID';
                  }
                  return null;
                },
                onSaved: (value) {
                  articleId = int.tryParse(value!);
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Comment',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a comment';
                  }
                  return null;
                },
                onSaved: (value) {
                  comment = value;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async{
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    String token=await uVM.getToken();
                    bool res= await cVM.addComment(Comments(articleId: articleId, comment: comment), token);
                    if (res) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add sucssful")));
                  Navigator.pushNamed(context, AppRoutes.home);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("some thing wrongQ!!")));

                }
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}