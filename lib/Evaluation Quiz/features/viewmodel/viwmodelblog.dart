import 'package:flutter_practis/Evaluation%20Quiz/core/APIURLConstant.dart';
import 'package:flutter_practis/Evaluation%20Quiz/core/APIall.dart';
import 'package:flutter_practis/Evaluation%20Quiz/features/model/Blog.dart';
import 'package:flutter_practis/Evaluation%20Quiz/features/model/Comment.dart';

class ViewModelBlog {
  APIMethods api = APIMethods();

  Future<List<Blog>> getBlog() async {
    List<dynamic>? li = await api.getData(apiUrl: ALLBLOGS);
    List<Blog> Bli =
        List.generate(li!.length, (index) => Blog.fromJson(li[index]));
    print(li);
    return Bli;
  }

  Future<List<Comment>?> getComent(String blogid) async {
    List<dynamic>? li =
        await api.getData(apiUrl: "${ALLBLOGS}/$blogid/comments");

    print(li);
    return List.generate(li!.length, (index) => Comment.fromJson(li[index]));
  }

  delete(String blogid) {
    api.deleteblog(apiUrl: "${ALLBLOGS}/${blogid}");
  }

  edit(Blog data) {
    api.update(data: data.toJson(), apiUrl: "${ALLBLOGS}/${data.id}");
  }
}
