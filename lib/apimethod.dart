import 'dart:convert';

import 'package:dio/dio.dart';

class APIMethod {
  Future<List<dynamic>?> LoadApi({required String apiUrl , required String key}) async {
    Dio d = Dio();

    Response<String> result = await d.get(apiUrl);

    Map<String, dynamic> cont = jsonDecode((result.data!));
    List<dynamic> product = cont[key];
    print(product);
    return product;
  }

  sendApi(Map<String, dynamic> data, String apiUrl) async {
    Dio d = Dio();

    Response<String> result = await d.post(apiUrl,
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'}));

    Map<String, dynamic> info = jsonDecode(result.data!);
    return info;
  }

  deletepost({required String apiUrl}) async {
    Dio d = Dio();

    Response<String> result = await d.delete(apiUrl);

    Map<String, dynamic> info = jsonDecode(result.data!);

    print(result);
    return info;
  }

  updatePost({required List<dynamic> data, required String apiUrl}) async {
    Dio d = Dio();

    Response<String> result = await d.put(apiUrl,
        data: data[0],
        options: Options(headers: {'Content-Type': 'application/json'}));

    dynamic info = jsonDecode(result.data!);
    return info;
  }
}
