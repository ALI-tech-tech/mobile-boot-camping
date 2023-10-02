import '../model/Course.dart';
import '../model/Student.dart';
import 'Crud.dart';

class Course_controller extends Crud {
  static List<Course> allcourses=[];
  
  @override
  addNew({required String name, int? no, double? fee}) {
    Course co=Course(name: name, no: no!, fee: fee!);
    allcourses.add(co);
  }
  
  @override
  display() {
    return allcourses;
  }
  
  @override
  displayOne({required String name}) {
    for (var i = 0; i < allcourses.length; i++) {
      if (name==allcourses[i].name) {
        return "course: ${allcourses[i].name},hours: ${allcourses[i].noofhours},fee:${allcourses[i].fee} ";
      }
    }
  }
  
  @override
  update({required String oldname, required String name, int? no, double? fee}) {
    Course co=Course(name: name, no: no!, fee: fee!);
    for (var i = 0; i < allcourses.length; i++) {
      if (oldname==allcourses[i].name) {
          allcourses.replaceRange(i, i+1, [co]);
      }
    }  
  }
  
  @override
  delete({required String name}) {
    for (var i = 0; i < allcourses.length; i++) {
      if (name==allcourses[i].name) {
        allcourses.remove(allcourses[i]);
      }
    }
  }
  
  addStudentsToCourse(List<Student> st,String Cours){
    // for (var i = 0; i < allcourses.length; i++) {
    //   if (Cours==allcourses[i].name) {
    //     allcourses[i].students=st;
    //   }
    // }
  }
 
  findcours(String name){
    for (var i = 0; i < allcourses.length; i++) {
      if (name==allcourses[i].name) {
        return allcourses[i];
      }
    }
  }
 
  
  
 
  
 

  
}