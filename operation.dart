import '../myfunction.dart';
import 'DateFormate.dart';
import 'person.dart';

class OPeration{

//method to display filter result
display(List<Person> p){
  String msg='''
>>> Who's birthday do you want to look up?''';
String info=input(msg+"Enter info to search : ");
  
  List<Person> filter=[];
  if (info.length>0) {
      if (isdigit(info)) {
      for (var i = 0; i < p.length; i++) {
        if (p[i].birthdate.toString().substring(8)==info) {
          filter.add(p[i]);
        }
      }
    }else{
      for (var i = 0; i < p.length; i++) {
        if (p[i].name.toString()==info) {
          filter.add(p[i]);
        }
      }
    }
  }else{
    print("pleas Enter info : ");
  }
  print("===============================================");
  if (filter.length>0) {
    filter.forEach((element) {
      print("${element.name} : ${element.birthdate}");
    });
  }else{
    print("${info} ==> not found");
  }
  
 print("===============================================");
}




//Add to list
add(List<Person> j){
  Person p3=Person(input("Enter birthday : "), input("Enter name : "));

   if (!(p3.birthdate.length<8)) {
    String birth2=DateFormate().date(p3.birthdate);
    p3.birthdate=birth2;
    j.add(p3);
   
   } 
}

//birthdate on month
countm(List<Person> l){
  Map<String, int> monthMap = {
    'January': 0,
    'February': 0,
    'March': 0,
    'April': 0,
    'May': 0,
    'June': 0,
    'July': 0,
    'August': 0,
    'September': 0,
    'October': 0,
    'November': 0,
    'December': 0,
  };
   List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
  ];

    
  for (var i = 0; i < l.length; i++) {
    int month=int.parse(l[i].birthdate.toString().substring(3,5))-1;
    String monthname= months[month];
    
    int sum=monthMap[monthname]!+1;
    monthMap[monthname]=sum;
  }
  print("------------------------------");
  monthMap.forEach((key, value) {
    if (value>0) {
      print("$key : $value");
    }
  });
  print("------------------------------");

}

}