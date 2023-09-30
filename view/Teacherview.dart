import '../Controller/Teachercontroller.dart';

import '../model/Teacher.dart';

class TeacherView {
  Teachercontroller tcon=Teachercontroller();

  addtecher(){
    tcon.addNew(name: "omer");
    tcon.addNew(name: "khaled");
  }

  displayalltechers(){
    List<Teacher> all= tcon.display();
    all.forEach((element) {
      print("Teacher: ${element.name}");
      element.courses.forEach((e) {
        print("course: ${e.name}");
      });
    });
  }
  find(){
    Teacher t1= tcon.displayOne(name: "Ali");
    print("${t1.name}");
    t1.courses.forEach((element) {
      print("course: ${element.name}");
    });
  }

  addcoursTeacher(){
    tcon.addcourse("Math","Ali");
    tcon.addcourse("Programming", "Ali");
  }
}