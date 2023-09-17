import 'Course.dart';

class Student {
  late int _rollno;
  late String _name;
  bool _isActive=true;
  List<Course> _registeredcourses=[];

  int get Rollno => this._rollno;
  set Rollno(int rollno){
    this._rollno=rollno;
  }

 String get name=>this._name;
set name(String name)=>this._name= name.length>4?name.toUpperCase():name.toLowerCase();

bool get isActive=>this._isActive;
set isActive(bool isActive)=>this._isActive=isActive;

print_registeredcourses(){
  _registeredcourses.forEach((element) {
    print("Coures : ${element.name} no. ${element.number} ");
  });
}
registercoures(Course co){
  if (_registeredcourses.length<4) {
    if ( co.isAvailable && (!isfound(co))) {
     
      _registeredcourses.add(co);
      print("Add Done");  
    }else{
      print("${co.name} is Found before ,Note : {${co.name} : ${co.isAvailable?" Available":"Not Available"}}");
    }
    
  }
  else{
    print("Can not add more than 4 Courses");
  }
}

isfound(Course co){
  for (var i = 0; i < _registeredcourses.length; i++) {
    if (_registeredcourses[i].number==co.number) {
      return true;
    }
  }
  return false;
}
}