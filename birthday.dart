import 'dart:convert';
import 'dart:io';
import 'myfunction.dart';

void main(List<String> args) {
  File f=File("day8\\birthday.json");
  var datafromfile=readJsonFile(f.path);
  screenuser(f.path);
}


readJsonFile(String filePath)  {
  String input =  File(filePath).readAsStringSync();
  if (!input.isEmpty) {
    var map = jsonDecode(input);
    return map;
  }
  return [];
  
}

screenuser(String path){
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
    print("------------------------------------------------\n>>>  We know the birthdays of:");
      var data=readJsonFile(path);
      data.forEach((element) { 
        print( element["name"]);
      });
    print("------------------------------------------------");
      display(path);
      break;
    
    case '2':
    List<Map<String,dynamic>> j=[];
    var data=readJsonFile(path);
    data.forEach((element) {
      j.add(element);
    });
    add(j);
    break;
    case '3':
    countm();

    break;
    default:
    print("good by");
  }

  } while (choose!='q');
}


//method to display filter result
display(String path){
  String msg='''
>>> Who's birthday do you want to look up?''';
String info=input(msg+"Enter info to search : ");
  var data=readJsonFile(path);
  List<Map<String,dynamic>> filter=[];
  if (info.length>0) {
      if (isdigit(info)) {
      for (var i = 0; i < data.length; i++) {
        if (data[i]["birthday"].toString().substring(8)==info) {
          
          Map<String,dynamic> add={
            "name":data[i]["name"],
            "birthday":data[i]["birthday"],
          };
          filter.add(add);
        }
      }
    }else{
      for (var i = 0; i < data.length; i++) {
        if (data[i]["name"].toString()==info) {
          Map<String,dynamic> add={
            "name":data[i]["name"],
            "birthday":data[i]["birthday"],
          };
          filter.add(add);
        }
      }
    }
  }else{
    print("pleas Enter info : ");
  }
  print("===============================================");
  if (filter.length>0) {
    filter.forEach((element) {
      print("${element["name"]} : ${element["birthday"]}");
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



add(List<Map<String,dynamic>> j){
  String name=input("Enter name : ");
    String birth=input("Enter birthday : ");
   if (!(birth.length<8)) {
    String birth2=date(birth);
    Map<String,dynamic> m={
      "name":name,
      "birthday":birth2,
    };
    j.add(m);
    File f=File("day8\\birthday.json");
    var st=jsonEncode(j);
    f.writeAsStringSync(st); 
   }else{
    print("pleas enter correct date !!");
   }
    
}

countm(){
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
  var data=readJsonFile("day8\\birthday.json");
    
  for (var i = 0; i < data.length; i++) {
    int month=int.parse(data[i]["birthday"].toString().substring(3,5))-1;
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