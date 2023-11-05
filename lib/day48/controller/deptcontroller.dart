import 'package:flutter_practis/day48/apide.dart';
import 'package:flutter_practis/day48/model/department.dart';

class DeptController {
  APIdp ap=APIdp();
  String Baseurl="https://654679c2fe036a2fa955bee7.mockapi.io/api/v1";
  Future<List<Department>> getdept() async{
    List<dynamic>? li= await ap.LoadApi(apiUrl: "${Baseurl}/departments");
    return List.generate(li!.length, (index) => Department.fromJson(li[index]));
  }

  adddept(Map<String,dynamic> data){
    var g= ap.sendApi(data, "${Baseurl}/departments");
    print(g);
  }
  edit(List<dynamic> data){
    ap.updatePost(data: data, apiUrl: "${Baseurl}/departments");
  }

  delet(String id){
    ap.deletepost(apiUrl:  "${Baseurl}/departments/${id}");
  }
}
