import 'package:postwithlaravelapi/helper/apihelper.dart';
import 'package:postwithlaravelapi/model/post.dart';

class PostViewmodel {
  List<Post> allPost=[];
  API api=API();

 Future< List<Post>> getAll()async{
    List<dynamic>? all=await api.LoadPost();
    allPost=all!.map((e) => Post.fromJson(e)).toList();
    return all!.map((e) => Post.fromJson(e)).toList() ;
  }
updatePost(Post post)async{
  Map<String,dynamic> data=post.toJson();
  int id=post.id!;
  data.remove("id");
  api.updatePost([id,data]);
}
  addpost(Post post)async{
    await api.sendPost(post.toJson());
  }
  deletepost(Post post){
    api.deletepost(post.id!);
  }
  
}