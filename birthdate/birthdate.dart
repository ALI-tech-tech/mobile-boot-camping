import 'dart:convert';
import 'dart:io';

import '../myfunction.dart';
import 'person.dart';


void main(List<String> args) {
  screenuser();
}




screenuser(){
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
      display(allperson);}
      else{
        print("pleas add befor ");
      }
      break;
    
    case '2':
    
    add(allperson);
    break;
    case '3':
    countm(allperson);

    break;
    default:
    print("good by");
  }

  } while (choose!='q');
}


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


String date(String date){
  List<String> s=date.split("/");
  if (s.first.length!=2) {
    s.replaceRange(0, 1, ["0${s.first}"]);
  }
  if(s[1].length!=2){
    s.replaceRange(1, 2, ["0${s[1]}"]);
  }
  
  return "${s.first}/${s[1]}/${s.last}";
}



add(List<Person> j){
  Person p3=Person(input("Enter birthday : "), input("Enter name : "));

   if (!(p3.birthdate.length<8)) {
    String birth2=date(p3.birthdate);
    p3.birthdate=birth2;
    j.add(p3);
   
   } 
}

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