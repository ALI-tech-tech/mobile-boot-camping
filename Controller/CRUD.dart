
import 'dart:convert';
import 'dart:io';

import '../Core/myfunction.dart';
import '../model/Task.dart';

class CRUD {
  static late CRUD c=CRUD._CRUD();
  CRUD._CRUD();
  static createobject() {
    if (c == null) {
      c = CRUD._CRUD();
    }
    return c;
  }

   
  add( Task t ,File f){
    List< Map<String,dynamic>> j =read(f);
    Map<String,dynamic> m={
      "title":t.title,
      "Description":t.description,
    };
    j.add(m);
    var st=jsonEncode(j);
    f.writeAsStringSync(st); 
   }
    



  read(File f){
    List<Map<String,dynamic>> j=[];
    String input =  f.readAsStringSync();
  if (!input.isEmpty) {
    var map = jsonDecode(input);
    map.forEach((element) {
      j.add(element);
    });
  } 
    
  return j;
  }

   update(List l ,File f){
    List< Map<String,dynamic>> j =read(f);
    for (var i = 0; i < j.length; i++) {
      if (j[i]["title"]==l[0]) {
        j[i]["title"]=l[1].title;
        j[i]["description"]=l[1].description;
      }
    }
    var st=jsonEncode(j);
    f.writeAsStringSync(st); 
  }

  remove(File f,String title){
    List< Map<String,dynamic>> j =read(f);
    for (var i = 0; i < j.length; i++) {
      if (j[i]["title"]==title) {
        j.remove(j[i]);
      }
    }
    var st=jsonEncode(j);
    f.writeAsStringSync(st); 
    
  }


}