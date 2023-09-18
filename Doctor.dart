import 'Person.dart';

class Doctor extends Person {
  late String specialty;
  Doctor({required String id ,required String fname,required String lname ,required String specialty}):super(id: id, fname: fname,lname: lname){
    this.specialty=specialty;
  }
  

  Displayinfo(){
    return "${super.Displayinfo()} ,specialty: ${specialty} ";
  }
}