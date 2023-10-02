import '../model/Course.dart';
import '../model/Grads.dart';
import '../model/Student.dart';
import 'Crud.dart';
import 'StudentController.dart';

class GardeController  {
  static List<Grad> allGrads=[];

  add({required Course co ,required Student student, required int mark}){
    allGrads.add(Grad(Course: co, mark: mark, student: student));     
  }
  addGradeRecord({ int? id, Course? c,int mark=0}){
    List<Student> studelist=StudentController.students;
   
    if (allGrads.where((element) => element.cours!.name==c!.name).length==3) {
        print("Course reach maxmum");
    }else{
       int index=studelist.indexWhere((element) => element.id==id);
    if (index!=-1) {
      allGrads.add(Grad(Course: c!, mark: mark, student: studelist[index]));
        
      }
    }
  }

  updateStudentCoursemark({int? id,String? name,int? mark=0}){
    int index=allGrads.indexWhere((element) => element.student!.id==id && element.cours!.name==name);
    allGrads[index].mark=mark;
  }
  
}