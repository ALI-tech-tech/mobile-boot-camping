import 'dart:io';
import 'myfunction.dart';

void main(List<String> args) {
  opearation();
}

String inputuser(){
  print("pleas choose operation");
  print("1-Add");
  print("2-Remove");
  print("3-view");
  print("4-Filter by name ");
  stdout.write("yor choose : ");
  String input_operation=input();

  return input_operation;
}

opearation(){
  List<Map>listmap=[];
  String input="";
  do {
  input=inputuser();
  
  switch (input) {
    case '1':
      stdout.write("enter title : ");
      String title=stdin.readLineSync().toString();
      stdout.write("enter body : ");
      var body=stdin.readLineSync().toString();
      if(!title.isEmpty || !body.isEmpty){
        Map<String,dynamic>todo={};
        todo["title"]=title;
        if(isdigit(body) ){
          todo["body"]=int.parse(body); 
        }else{
          todo["body"]=body;
        }
        listmap.add(todo);
        print(" done");
      }else{
        print("no thing to add pleas enter title and body");
      }
      print("---------------------------------------------");
      break;

    case '2':
      if(listmap.length>0){
        stdout.write("enter title : ");
        var title=stdin.readLineSync().toString();
        for (var i = 0; i < listmap.length; i++) {
          if(listmap[i]["title"]==title){
            listmap.removeAt(i);
            print("==================================\n remove done \n==================================");            
          }else{
            print("pleas enter correct title !!!");
          }
        }
        
      }else{
        print("===================================================\n no thing to remove?! \n================================================ ");
      }  
      break;
    
    case '3':
    print("=================================================");
    if(listmap.length>0){
      for (var i = 0; i < listmap.length; i++) {
        print("title : ${listmap[i]["title"]} ");
        print("body : ${listmap[i]["body"]}");
        print("-------------------------------------------------");

      }
    }else{
      print("no thing to show?!!\n=================================================");
    }
      
    case '4':
     Filter(listmap);
    

    case 'q':
    print("good by");
    break;
  default:
  print("pleas enter correct number");

      
    
   

     
  }
  
} while (input!='q');

}

Filter(List<Map> todo){
  List<Map>result=[];
  if (todo.length>0) {
    String f=input("Enter Title : ");
    for (var i = 0; i < todo.length; i++) {
      if (todo[i]["title"].toString().contains(f)) {
        result.add(todo[i]);
      }
    }
    if(result.length>0){
    for (var i = 0; i < result.length; i++) {
      print("-----------------------------------");
      print("Title : ${result[i]["title"]}");
      print("Body : ${result[i]["body"]}");
      print("-----------------------------------");
    }}
    else{
      print("not found \n ================================================");
    }
    
  }else{
    print("==============================\n Add element first!!! \n ==============================");
  }
  
}