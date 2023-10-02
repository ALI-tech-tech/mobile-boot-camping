import 'dart:io';

bool isdigit(String value){
  var parsenum=int.tryParse(value);
  if (parsenum!=null) {
    return true;
    
  }
  return false;
}
bool isdouble(String value){
  var parsenum=double.tryParse(value);
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

checkvalue(String txt){
  if (isdigit(txt)) {
    return int.parse(txt);
  }else if(isdouble(txt)){
    return double.parse(txt);
  }
  else{
    return 0;
  }
}

bool iffound(List d ,String txt){
  for (var i = 0; i < d.length; i++) {
    if (d[i].toString().contains(txt)) {
      return true;
    }
  }
  return false;
}