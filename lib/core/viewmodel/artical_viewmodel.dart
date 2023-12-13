import 'dart:io';

import 'package:blogappwithrealapi/core/model/article.dart';
import 'package:blogappwithrealapi/utils/urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/api_helper.dart';

class ArticalViewModel with ChangeNotifier {
  List<Article> allarticle=[];
  APIdp api = APIdp();
  File? imag;

ArticalViewModel(){
  getAll();
}
  getAll()async{
    List<dynamic> ma=await api.LoadApi(apiUrl: AppURL.LISTARTICLES);
    allarticle=ma.map((e) => Article.fromJson(e)).toList();
    notifyListeners();
  }

  addArtical(Article article ,String authToken)async{
    Map<String,dynamic> data=await prepareArticle(article);
    
     Map<String, dynamic> result =
        (await api.sendApiwithimage(data, AppURL.ADDARTICLE,authToken ))['result'];
     if (result['code'] == 1200) {
      return true;
    }else{
      return false;
    }
  }

  Future<Map<String,dynamic>> prepareArticle(Article article)async{
    Map<String,dynamic> data=article.toJson();
    data.remove("id");
    List<int> imageBytes = await imag!.readAsBytes();
    data['image']=MultipartFile.fromBytes(imageBytes,filename: 'image.jpg');
    return data;
  }
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    imag = File(image.path);
    notifyListeners();
  }

  getToken(){

  }
}