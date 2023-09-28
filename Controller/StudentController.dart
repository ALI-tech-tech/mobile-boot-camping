
import '../model/Student.dart';

class StudentController {
  static List<Student> students=[];
  
  bool addNewStudent({required name}){
    Student st=Student(id: students.length+1, name: name);
    students.add(st);
  return true;
  }

  List<Student> showStudent(){
    return students;
  }

  

}