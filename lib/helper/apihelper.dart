import 'dart:convert';

import 'package:dio/dio.dart';

class API {
  String url="http://10.3.143.3:8000/api/posts";
  Future<List<dynamic>?> LoadPost() async {
    Dio d = Dio();
    Response<String> result = await d.get(url);
    Map<String, dynamic> cont = jsonDecode((result.data!));
    List<dynamic> product = cont["data"];
    print(product);
    return product;
  }

  Future<List<dynamic>?> getPost(int id) async {
    Dio d = Dio();
    Response<String> result = await d.get("${url}/${id}");
    Map<String, dynamic> cont = jsonDecode((result.data!));
    List<dynamic> product = cont["data"];
    print(product);
    return product;
  }

  sendPost(Map<String, dynamic> data) async {
    Dio d = Dio();
    Response<String> result = await d.post(url,
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'}));

   
    Map<String, dynamic> info = jsonDecode(result.data!);
    return info;
    
  }

  deletepost(int id)async {
    Dio d = Dio();
    String apiUrl = '${url}/$id';
    Response<String> result = await d.delete(apiUrl);

    Map<String, dynamic> info = jsonDecode(result.data!);
    
    print(result);
    return info;
  }

  updatePost(List< dynamic> data) async {
    Dio d = Dio();
    String apiUrl = '${url}/${data[0]}';

    Response<String> result = await d.put(apiUrl,
        data: data[1],
        );

    dynamic info = jsonDecode(result.data!);
    return info;
  
  }
}
