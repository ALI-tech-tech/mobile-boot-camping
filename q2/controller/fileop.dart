import 'dart:convert';
import 'dart:io';

import '../../q1/model/Person.dart';
import '../model/program.dart';

class FileOper {
  File? f=File("Evaluationexam3\\q2\\data\\programs_info.json");
  static FileOper? _ff=FileOper();
  //FileOper({required this.f});

static createopject(){
  if (_ff!=null) {
    _ff==FileOper();
  }
  return _ff;
}

  read() {
    List<Map<String, dynamic>> j = [];
    String input = f!.readAsStringSync();
    if (!input.isEmpty) {
      var map = jsonDecode(input);
      map.forEach((element) {
        j.add(element);
      });
    }
    return j;
  }

  add( Program p){
    List< Map<String,dynamic>> j =read();
    Map<String,dynamic> m={
      "id":p.id,
        "name":p.program_name,
        "fees":p.fees
    };
    j.add(m);
    var st=jsonEncode(j);
    f!.writeAsStringSync(st); 
   }
}
