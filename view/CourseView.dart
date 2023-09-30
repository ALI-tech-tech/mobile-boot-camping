import '../Controller/Coursecontroller.dart';
import '../model/Course.dart';

class CourseView {
  Course_controller co=Course_controller();

  add(){
    co.addNew(name: "Math",fee: 2500.0,no: 250);
    co.addNew(name: "Programing",fee: 3000.0,no: 300);
  }

  display(){
    List<Course> lc= co.display();
    lc.forEach((element) {
      print("course : ${element.name} ,fee:${element.fee},No.hours: ${element.noofhours}");
    });
  }
}