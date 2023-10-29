import 'package:flutter_practis/day42/datasource/localdata.dart';
import 'package:flutter_practis/day42/model/Post.dart';

class PostController {
  late List<Post> allposts;
  List<Map<String,dynamic>>? li;
  

  Future<List<Post>> fetchPosts() async{
    
    LocalFile db=LocalFile();
    allposts= await db.readJsonFile();
    
    return allposts;
  }
}