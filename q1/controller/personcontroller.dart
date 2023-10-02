import '../Exptions/Myexption.dart';
import '../View/PersonView.dart';
import '../model/Person.dart';
import '../model/PersonBuilder.dart';

class PersonController {
  late PersonBuilder p1;
  late PersonView pv;
  List<String> listhobbis=[];
  PersonController({required this.p1,required this.pv});

  addage({ required int age }){
    p1.age=age;
  }
  addprofession({required String profession}){
    p1.profession=profession;
  }
  addhobbise(String hob){
   p1.hobbies=hob;
  }

  showperson(){
    print("Name ${p1.firstName} ${p1.lastName}\nHobbies: ${p1.hobbies}\nProfession:${p1.profession}\nage:${p1.age}");
  }

}