import 'dart:io';
import 'dart:math';

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

bool isprime(int num){
  for (var i = 2; i < num; i++) {
    if (num%i==0 && i!=num) {
      return false;
    }
  }
  return true;
}

Map<String,dynamic> sumprime(List<int> li,int primenum){
  int m=primenum;
 Map<String,dynamic> result={
  "sum":0,
  "prime":primenum
 };
  for (var i = 0; i < li.length; i++) {
   if (li[i]%primenum==0) {
     result["sum"]+=li[i];
     
   }
  }
  return result;
}


max(List<int> li){
  int max=li[0];
  for (var i = 0; i < li.length; i++) {
    if (max<li[i]) {
      max=li[i];
    }
  }
  return max;
}