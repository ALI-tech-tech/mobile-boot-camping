import 'myfunction.dart';

void main(List<String> args) {
  List<String>repeat=[];
  List<Map<String,dynamic>>alpha=[];
  String txt=input("enter youe txt : ");
  for (var i = 0; i < txt.length; i++) {  
      alpha.add({"num":count(txt[i], txt),"letter":txt[i]});
    }
  for (var i = 0; i < alpha.length; i++) {
    if (alpha[i]["num"]>1) {
      if (!repeat.contains(alpha[i]["letter"])) {
        repeat.add(alpha[i]["letter"]);
        print("Letter ${alpha[i]["letter"]} : ${alpha[i]["num"]} times"); 
      }
      
    }
  }
  

}


int count(String a,String word){
  int c=0;
  for (var i = 0; i < word.length; i++) {
    if (a==word[i]) {
      c++;
    }
  }

  return c;
}