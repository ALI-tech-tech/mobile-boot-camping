import 'dart:io';

import '../Controller/CRUD.dart';
import '../model/Task.dart';
import '../Core/myfunction.dart';

class Home {
  CRUD crud=CRUD.createobject();
  String msg='''
choose operation:
1-View Task
2-Add Task
3-Remove Task
4-Update Task
''';
  
  view1(){
    return input(msg +"\nYour Choose : ");
  }
  filename(){
    return input("Enter File name : ");
  }
  insertTask(){
    
    return Task(title: input("Enter title : "), description: input("Enter Description : "));
  }
  viewAllTasks(File f){
    (crud.read(f)).forEach((element) {
      element.forEach((key, value) {
        print("$key : $value");
      });
    });
  }

  removetask( ){
    return input("Enter title : "); 
  }

update(){
  String old=input("Enter old Title : ");
  Task t=Task(title: input("Enter new title : "), description: input("Enter new Description"));
  return [old,t];
}


}