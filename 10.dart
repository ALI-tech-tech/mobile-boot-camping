import 'myfunction.dart';

void main(List<String> args) {
  List<String> listnum=input("enter list number : ").split(" ");
  int j=0;
  print(listnum);
  for (var i = 0; i < listnum.length; i++) {
    if (listnum[i]=="4") {
      j+=1; 
    }
  }
  print(j);
}
