import 'dart:io';

void main(List<String> args) {
  print("pleas enter your messsage:");
  String inputuser=stdin.readLineSync().toString();
  List<String> msgwords=inputuser.split(" ");
  msgwords.forEach((element) {
    if(element!=revstring(element)){
      stdout.write(element+" ");
    }
  });
 

}

String revstring(String word){
  String rev="";
  for (var i = word.length-1; i>=0; i--) {
    rev+=word[i];
  }

  return rev;
}