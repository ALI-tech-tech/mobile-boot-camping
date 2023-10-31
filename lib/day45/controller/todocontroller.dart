import 'package:flutter_practis/day45/api.dart';
import 'package:flutter_practis/day45/model/todo.dart';

class TodoController {
  API api=API();
  Future<List<TODO>> getpost()async{
    List<dynamic>? alltask=await api.LoadPost();
    List<TODO> tasks=alltask!.map((e) => TODO.fromJson(e)).toList();
    return tasks;
  }

  sendpost(Map<String,dynamic> data){
    return api.sendPost(data);
  }
}