import 'myfunction.dart';

void main(List<String> args) {
  String txt=input("enter : ");
  List<String> vowel=["a","e","o","i","u","A","O","E","I","U"];
  List<String>char=[];
  for (var i = 0; i < txt.length; i++) {
    if (vowel.contains(txt[i]) ) {
      char.add(txt[i]);
    }
    
  }
  if (char.length>0) {
    print("yse ");
    print("vowel letter is : ${char}");
  }

}