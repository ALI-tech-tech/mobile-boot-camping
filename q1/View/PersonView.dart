import '../../../Day10/mypackage/myfunction.dart';
import '../controller/personcontroller.dart';
import '../model/PersonBuilder.dart';

class PersonView {
  late PersonController pc;
  String msg='''
1-add user
2-add age
3-add profession
4-add hobbies
5-show Details
''';

Startview(){
  String userchose="";
  do {
    String userchose=input(msg+"\nEnter chose : ");
    switch (userchose) {
      case '1':
        pc=PersonController(p1: PersonBuilder(firstName: input("Enter First name : "), lastName:  input("Enter Last name : ")), pv: PersonView());
        break;
      case '2':
      pc.addage(age:(int.parse( input("Enter age : "))));
      case '3':
      pc.addprofession(profession: input("Enter profession : "));
      case '4':
      pc.addhobbise(input("Enter Hobbies : "));
      case '5':
      pc.showperson();
      default:
      print("Good By...");
    }
  } while (userchose!='q');
}


}