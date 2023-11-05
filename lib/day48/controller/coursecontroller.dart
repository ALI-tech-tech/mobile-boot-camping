
import 'package:flutter_practis/day48/apide.dart';
import 'package:flutter_practis/day48/model/Course.dart';
import 'package:flutter_practis/day48/model/department.dart';

class CourseController {
  APIdp ap=APIdp();
  String Baseurl="https://654679c2fe036a2fa955bee7.mockapi.io/api/v1/departments/";
  Future<List<Course>> getCourse({required String id}) async{
    List<dynamic>? li= await ap.LoadApi(apiUrl: "${Baseurl}/${id}/courses");
    return List.generate(li!.length, (index) => Course.fromJson(li[index]));
  }

  adddept(Map<String,dynamic> data, String id){
    var g= ap.sendApi(data, "${Baseurl}/${id}/courses");
    print(g);
  }
  edit(String coid, Map<String,dynamic> data, String deptid){
    List<dynamic> li=[data, coid];
    ap.updatePost(data: li, apiUrl: "${Baseurl}/${deptid}/courses");
  }

  delet(String deptid , String coid){
    var h= ap.deletepost(apiUrl:  "${Baseurl}/${deptid}/courses/${coid}");
    print(h);
    return h;
    
  }
}
