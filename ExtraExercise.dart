
import 'dart:io';
import 'myfunction.dart';

void main(List<String> args) {
  File f=new File("assets\\question7.txt");
  f.create(recursive: true);
  List<String> res= f.readAsLinesSync();
  print( res);
  insert(res, f);
  String g=input();
  String txtt= f.readAsStringSync();
  List<String> li= txtt.split("\n");
  print(" bbbb : $li");
  upercase(li, f);
  List<String> li2= txtt.split("\n");
  print(" bbbb : $li2");


 
}


insert(List<String> txt ,File f)async {
 if (!((txt).length>0)) {
    var file=f.openWrite();
    for (var i = 1; i <= 5; i++) {
      file.writeln(input("Enter line $i : "));
    }
    file.close();
    

  }
}

upercase(var txt,File f){
    f.writeAsString("");
    var file=f.openWrite();
      for (var i = 0; i < txt.length; i++) {
        file.writeln(txt[i].toUpperCase());
      }
      file.close();
}
