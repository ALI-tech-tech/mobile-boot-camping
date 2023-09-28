import '../Controller/StudentController.dart';
import '../Controller/gradecontroller.dart';
import '../model/Grads.dart';

class StudentView {
  StudentController st=StudentController();
  GardeController gd=GardeController();

  show(){
    StudentController.students.forEach((element) {
      print("${element.name},${element.id}");
      element.getGrads!.forEach((e) {
        print("${e.cours},${e.mark},${e.Grade}");
      });
    });
  }

  newstudent(){
    st.addNewStudent(name: "ALi");
    st.addNewStudent(name: "Ahmed");
  }
   addgrades(){
    gd.addcourse(Grad(Course: "Math", mark: 90), 1);
    gd.addcourse(Grad(Course: "Programming", mark: 80), 1);
    gd.addcourse(Grad(Course: "Math", mark: 85), 2);
    gd.addcourse(Grad(Course: "Programming", mark: 95), 2);
   }

}