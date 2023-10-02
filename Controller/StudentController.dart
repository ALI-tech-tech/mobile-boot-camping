
import '../model/Course.dart';
import '../model/Student.dart';
import 'Coursecontroller.dart';
import 'gradecontroller.dart';

class StudentController {
  static List<Student> students=[];
  
  bool addNewStudent({required name}){
    int id=students.isEmpty?1:students.last.id+1;
    Student st=Student(id:id, name: name);
    students.add(st);
  return true;
  }
  removeStudent(int id){
    students.removeWhere((element) => element.id==id);
    return true;
  }

  List<Student> showStudent(){
    return students;
  }
  displayStudent(int? id ){
    int index=students.indexWhere((element) => element.id==id);
    if (index!=-1) {
      return students[index];
    }else{
      return []; 
    }
      }
  allstudentwithtotalfee(){
    for (var i = 0; i < students.length; i++) {
      print(" Student :${students[i].name} Totalfee:${this.totalfeeAstudent(students[i].id)}");
    }
  }

register({ int? id,String? name}){
  Course cours= Course_controller.allcourses.firstWhere((element) => element.name==name,orElse: ()=>Course());
  if(cours.name!=null){
  GardeController gr=GardeController();
  gr.addGradeRecord(c:cours,id:id);
  }
}
  updatestudent(Student student){
    int index=students.indexWhere((element) => element.id=student.id);
    if (index!=-1) {
      students[index]=student;
      return true;
    }else{
      return false;
    }
  }

  totalfeeAstudent(int id){
    double sum=0;
    GardeController.allGrads.where((element) => element.student!.id==id).forEach((element) {
      sum+=element.cours!.fee;
    });
    return sum;
  }

displayall(Student st){
  students.forEach((element) {
    print(element.name);

    double tot=0;
    GardeController.allGrads.where((element) => element.student!.id==st.id).forEach((element) {
      
    });

  });

}

filter(String? dept){
  students.forEach((element) {
    if (element.d==dept) {
      print(element.name);
    }
  });

}
}