import 'dart:io';
import 'Controller/CRUD.dart';
import 'model/connection.dart';
import 'view/Home.dart';

void main(List<String> args) {
  Home home=Home();
  File con=Connection.createfile("Data", "Task.json");
  CRUD crud=CRUD.createobject();
  String choose='';
  do {
    choose=home.view1();
    switch (choose) {
   
    case '1':
        home.viewAllTasks(con);
        break;
    case '2':
      crud.add(home.insertTask(), con);
      break;
    case '3':
      crud.remove(con, home.removetask());
      break;

    case '4':
    crud.update(home.update(), con);
    default:
  }
  } while (choose!='q');
  

  
}