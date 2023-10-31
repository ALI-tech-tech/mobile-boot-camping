import 'dart:convert';

import 'package:dio/dio.dart';

class API {
  Future<List<dynamic>?> LoadPost() async {
    Dio d = Dio();
    const apiUrl = 'https://dummyjson.com/todos';

    Response<String> result = await d.get(apiUrl);

    Map<String, dynamic> cont = jsonDecode((result.data!));
    List<dynamic> product = cont["todos"];
    print(product);
    return product;
  }

  sendPost(Map<String, dynamic> data) async {
    Dio d = Dio();
    const apiUrl = 'https://dummyjson.com/todos/add';

    Response<String> result = await d.post(apiUrl,
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'}));

    //if(result.statusCode==201){
    Map<String, dynamic> info = jsonDecode(result.data!);
    return info;
    //}
    // else {
    //   return {"id":-1};
    // }
  }

  deletepost(int id)async {
    Dio d = Dio();
    String apiUrl = 'https://dummyjson.com/todos/$id';
    Response<String> result = await d.delete(apiUrl);

    Map<String, dynamic> info = jsonDecode(result.data!);
    
    print(result);
    return info;
  }

  updatePost(List< dynamic> data) async {
    Dio d = Dio();
    String apiUrl = 'https://dummyjson.com/todos/${data[1]}';

    Response<String> result = await d.put(apiUrl,
        data: data[0],
        options: Options(headers: {'Content-Type': 'application/json'}));

    dynamic info = jsonDecode(result.data!);
    return info;
  
  }
}
