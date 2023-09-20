import 'dart:io';

import '../myfunction.dart';
import 'Todo.dart';


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
  List<Todo>listmap=[];
  String input="";
  do {
  input=inputuser();
  
  switch (input) {
    case '1':
      Todo todo1=Todo();
      stdout.write("enter title : ");
      todo1.Title=stdin.readLineSync().toString();
      stdout.write("enter body : ");
      todo1.body=stdin.readLineSync().toString();
      if(!todo1.Title.isEmpty || !todo1.body.isEmpty){
        
        listmap.add(todo1);
        print(" done");
      }else{
        print("no thing to add pleas enter title and body");
      }
      print("---------------------------------------------");
      break;

    case '2':
      if(listmap.length>0){
        stdout.write("enter number of task : ");
        var title=stdin.readLineSync().toString();
        if (!(int.parse(title)>listmap.length)) {
          listmap.removeAt(int.parse(title)-1);  
        }else{
          print("not found");
        }
        
        
        
      }else{
        print("===================================================\n no thing to remove?! \n================================================ ");
      }  
      break;
    
    case '3':
    print("=================================================");
    if(listmap.length>0){
      for (var i = 0; i < listmap.length; i++) {
        print("title : ${listmap[i].Title} ");
        print("body : ${listmap[i].body}");
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

Filter(List<Todo> todo){
  List<Todo>result=[];
  if (todo.length>0) {
    String f=input("Enter Title : ");
    for (var i = 0; i < todo.length; i++) {
      if (todo[i].Title.toString().contains(f)) {
        result.add(todo[i]);
      }
    }
    if(result.length>0){
    for (var i = 0; i < result.length; i++) {
      print("-----------------------------------");
      print("Title : ${result[i].Title}");
      print("Body : ${result[i].body}");
      print("-----------------------------------");
    }}
    else{
      print("not found \n ================================================");
    }
    
  }else{
    print("==============================\n Add element first!!! \n ==============================");
  }
  
}