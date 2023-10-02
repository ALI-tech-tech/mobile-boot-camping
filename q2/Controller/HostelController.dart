import '../main.dart';
import '../model/Hostel.dart';
import '../model/Student.dart';

class HostelController {
  List<Hostel> hostels=[];

  add(){
    Hostel h1=Hostel(type: Types.boys, room: 50, block: 2, fees: 100);
    Hostel h2=Hostel(type: Types.girls, room: 50, block: 2, fees: 100);
    Hostel h3=Hostel(type: Types.boys, room: 50, block: 2, fees: 100);
    Hostel h4=Hostel(type: Types.girls, room: 50, block: 2, fees: 100);
    
    h1.students=[Student(id: 1, name: "Ali"),Student(id: 2, name: "Ahmed"),Student(id: 3, name: "Ah")];
   hostels.addAll([h1,h2,h3,h4]);
  }

  payfees(Hostel h){
    h.paid=true;
  }
  checkin(){

  }
  checkout(){

  }
  browse (){
    hostels.forEach((element) {
      print("Hostel : ${element.type}, ${element.block},${element.fees},${element.room}\nStudents: ");
      
      element.students!.forEach((e) {
        print("${e.name}");
      });
    });
  }
}