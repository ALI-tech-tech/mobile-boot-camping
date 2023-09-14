

import '../mypackage/myfunction.dart';

gitbookid(List<Map<String, dynamic>> li){
  int idint=0;
  String id=input("Enter Book Number / ID : ");
  if (isdigit(id)) {
    idint=int.parse(id);
    return idint;
  }
  print("pleas Enter correct number");
}