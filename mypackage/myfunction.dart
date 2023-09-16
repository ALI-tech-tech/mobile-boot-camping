import 'dart:io';

bool isdigit(String value){
  var parsenum=int.tryParse(value);
  if (parsenum!=null) {
    return true;
    
  }
  return false;
}

bool isnumber(String value){
  var parsedig=int.tryParse(value);
  var parsedoub=double.tryParse(value);
  if (parsedig!=null || parsedoub!=null) {
    return true;  
  }
  return false;
}

String input([String msg=""]){
  stdout.write(msg);
  String userinput= stdin.readLineSync().toString();
  return userinput;
}