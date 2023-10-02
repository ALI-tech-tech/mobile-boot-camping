import 'dart:io';

import '../data/api.dart';
import 'fileop.dart';
import '../model/program.dart';

class Programadapter {
  List<Program> lp=[];
  APi api=APi();
  FileOper fil=FileOper.createopject();
  getdata(){
    getdatafromapi();
    getdatafromfile();
    return lp;
  }
  getdatafromapi(){
    List<Map< String,dynamic>> fromapi=api.getdata();
    fromapi.forEach((element) {
      Program p= Program();
      lp.add(p.fromapi(element));
    });
  }
  getdatafromfile(){
    List<Map< String,dynamic>> fromfile=fil.read();
    fromfile.forEach((element) {
      Program p= Program();
      lp.add(p.fromjson(element));
    });
  }
  
}