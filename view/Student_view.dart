import '../Controller/StudentController.dart';
import '../Controller/gradecontroller.dart';
import '../model/Course.dart';
import '../model/Grads.dart';

class StudentView {
  StudentController st=StudentController();
  GardeController gd=GardeController();

  show(){
    StudentController.students.forEach((element) {
      print("${element.name},${element.id}");
      element.getGrads!.forEach((e) {
        print("${e.cours!.name},${e.mark},${e.Grade}");
      });
    });
  }

  newstudent(){
    st.addNewStudent(name: "ALi");
    st.addNewStudent(name: "Ahmed");
  }
   addgrades(){
    gd.addcourse(Grad(Course: Course(name: "Math",fee: 2500.0,no: 250), mark: 90), 1);
    gd.addcourse(Grad(Course: Course(name: "Programing",fee: 3000.0,no: 300), mark: 80), 1);
    gd.addcourse(Grad(Course: Course(name: "Math",fee: 2500.0,no: 250), mark: 85), 2);
    gd.addcourse(Grad(Course: Course(name: "Programing",fee: 4000.0,no: 300), mark: 95), 2);
   }
   viewwithtotalfee(){
    st.allstudentwithtotalfee();
   }


}