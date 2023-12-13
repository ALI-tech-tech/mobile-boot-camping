import 'dart:io';

import 'package:blogappwithrealapi/core/model/article.dart';
import 'package:blogappwithrealapi/core/viewmodel/artical_viewmodel.dart';
import 'package:blogappwithrealapi/core/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddArticleView extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  File? image;
  @override
  Widget build(BuildContext context) {
    ArticalViewModel aVM=Provider.of<ArticalViewModel>(context);
    UserViewModel uVM=Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Article'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Content',
              ),
              maxLines: null,
            ),
            Consumer(
              builder: (context, value, child) =>TextField(

              onTap: ()async{
                
                await aVM.pickImage();
                imageController.text=aVM.imag!.path??"no image choose";
              },
              controller: imageController,
              decoration: InputDecoration(
                labelText: 'Image URL',
              ),
            ), ),
            
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: ()async {
                
                String? title = titleController.text;
                String? content = contentController.text;
                String? image = imageController.text;
                String token=await uVM.getToken();
                bool res=  await  aVM.addArtical(Article(title: title, content: content), token);
                if (res) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add sucssful")));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("some thing wrongQ!!")));

                }
                
                idController.clear();
                titleController.clear();
                contentController.clear();
                imageController.clear();
              },
              child: Text('Save Article'),
            ),
          ],
        ),
      ),
    );
  }

  
 
}
