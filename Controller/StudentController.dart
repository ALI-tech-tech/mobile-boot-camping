
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

  allstudentwithtotalfee(){
    for (var i = 0; i < students.length; i++) {
      print(" Student :${students[i].name} Totalfee:${this.totalfeeAstudent(students[i].id)}");
    }
  }

  totalfeeAstudent(int id){
    double sum=0;
    for (var i = 0; i < students.length; i++) {
      if (students[i].id==id) {
        students[i].getGrads!.forEach((element) {
          sum+=element.cours!.fee;
        });
      }
    }
    return sum;
  }

}