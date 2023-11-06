import 'dart:convert';

import 'package:dio/dio.dart';

class APIMethods {
  Future<List<dynamic>?> getData({required String apiUrl}) async {
    Dio d = Dio();

    Response<String> result = await d.get(apiUrl);

    List<dynamic> cont = jsonDecode((result.data!));

    print(cont);
    return cont;
  }
}
