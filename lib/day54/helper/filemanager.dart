import 'dart:convert';

import 'package:flutter/services.dart';


class FileMnager {
  

  Future<List<dynamic>> readJson(String path) async {
    final String response = await rootBundle.loadString(path);
    List<dynamic> data = await json.decode(response)  ;
    print(data);
    return data ;
  }


}
