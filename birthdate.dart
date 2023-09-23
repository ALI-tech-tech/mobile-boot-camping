import '../myfunction.dart';
import 'operation.dart';
import 'person.dart';


screenuser(){
  OPeration op=OPeration();
  List<Person> allperson=[];
  print("Welcom to the birthday program");
  String choose="";
  do {
    String msg='''
 
pleas choose operation: 
1-View available info . 
2-Add new . 
3-Get the months of all birthdays.
''';
 choose=input(msg+"your choose : ");
  switch (choose) {
    case '1':
    
      if(allperson.length>0){
        print("------------------------------------------------\n>>>  We know the birthdays of:");
      allperson.forEach((element) {
        print(element.name);
      });
    print("------------------------------------------------");
     op.display(allperson);}
      else{
        print("pleas add befor ");
      }
      break;
    
    case '2':
    
    op.add(allperson);
    break;
    case '3':
    op.countm(allperson);

    break;
    default:
    print("good by");
  }

  } while (choose!='q');
}








