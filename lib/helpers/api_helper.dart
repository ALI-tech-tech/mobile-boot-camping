import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class APIdp {
  Future<List<dynamic>> LoadApi({required String apiUrl }) async {
    Dio d = Dio();

    Response<String> result = await d.get(apiUrl);

    Map<String, dynamic> cont = jsonDecode((result.data!));
   
    print(cont);
    return cont['result']['data'];
    
  }

  sendApi(Map<String, dynamic> data, String apiUrl) async {
    Dio d = Dio();
   
    Response<String> result = await d.post(apiUrl,
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'}));

    Map<String, dynamic> info = jsonDecode(result.data!);
    print(info['result']);
    return info;
  }
   sendApiwithimage(Map<String, dynamic> data, String apiUrl, String authToken) async {
    Dio d = Dio();
    FormData formData = FormData.fromMap(data);
    Response<String> result = await d.post(apiUrl,
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $authToken'}));

    Map<String, dynamic> info = jsonDecode(result.data!);
    print(info['result']);
    return info;
  }

  deleteApi({required String apiUrl}) async {
    Dio d = Dio();

    Response<String> result = await d.delete(apiUrl);

    Map<String, dynamic> info = jsonDecode(result.data!);

    print(result);
    return info;
  }

  updateApi({required List<dynamic> data, required String apiUrl}) async {
    Dio d = Dio();
  print(apiUrl+"/"+data[1]);
    Response<String> result = await d.put(apiUrl+"/"+data[1],
        data: data[0],
        options: Options(headers: {'Content-Type': 'application/json'}));

    dynamic info = jsonDecode(result.data!);
    return info;
  }
}
