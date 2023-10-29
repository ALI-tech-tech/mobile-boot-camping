import 'dart:convert';


import 'package:flutter/services.dart';
import 'package:flutter_practis/day42/model/Post.dart';

class LocalFile {
  String filepath="assets\\post.json";

  Future<List<Post>> readJsonFile() async {
  String input =  await rootBundle.loadString('assets/post.json');
  List<Post> map = (json.decode(input) as List).map((e) => Post.fromJson(e)).toList();
  return map;
}


}