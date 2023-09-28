import '../model/Grads.dart';
import 'StudentController.dart';

class GardeController {
  addcourse(Grad g , int id){
    for (var i = 0; i < StudentController.students.length; i++) {
      if (StudentController.students[i].id==id) {
        StudentController.students[i].setGrads=g;
      }
    }
   
  }
}