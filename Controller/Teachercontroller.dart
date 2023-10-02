import '../model/Course.dart';
import '../model/Teacher.dart';
import 'Coursecontroller.dart';
import 'Crud.dart';

class Teachercontroller extends Crud {
  static List<Teacher> teachers=[];
  @override
  addNew({required String name, int? no, double? fee}) {
      Teacher t=Teacher(name: name, id: getid());
      teachers.add(t);
  }
    getid()=>teachers.length>0?(teachers.last.id!+1):1;

  @override
  display() => teachers;
  
  @override
  displayOne({required String name}) {
    for (var i = 0; i < teachers.length; i++) {
      if (name==teachers[i]) {
        return teachers[i];
      }
    }
  }
  
  @override
  update({required String oldname, required String name, int? no, double? fee}) {
    
    for (var i = 0; i < teachers.length; i++) {
      if (oldname==teachers[i].name) {
        Teacher te=Teacher(name: name, id: teachers[i].id);
          teachers.replaceRange(i, i+1, [te]);
      }
    }  
  }
  
  @override
  delete({required String name}) {
    for (var i = 0; i < teachers.length; i++) {
      if (name==teachers[i].name) {
        teachers.remove(teachers[i]);
      }
    }
  }

  addcourse(String course ,String teacher){
    Course_controller co=Course_controller();
    for (var i = 0; i < teachers.length; i++) {
      if (teacher==teachers[i].name) {
        teachers[i].courses.add(co.findcours(course));
      }
    }
  }



   
}