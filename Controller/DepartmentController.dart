import '../model/department.dart';

class DepartmentController {
  static List<Department>departments =[];

  adddept({required String name}){
   if (!checkname(name)) {
     Department d1=Department(id: getid(), name: name);
   }else{
    print("name found before");
   }
  }

  getid()=>departments.length>0?(departments.last.id!+1):1;
  checkname(String? name)=>departments.firstWhere((element) => element.name==name)!=null;

}