import 'dart:math';
import 'myfunction.dart';

void main(List<String> args) {
  
  var n=Random().nextInt(100);
  bool run=true;
  while (run) {
    String userinput= input("Guess number : ");
    if(isdigit(userinput)){
      if (int.parse(userinput)==n) {
        print("good ");
      }
      else if(int.parse(userinput)>n){
        print("$userinput greater than number");
      }
      else if(int.parse(userinput)<n){
        print("$userinput less than number");
      }
      

    }else if(userinput=="q"){
      run=false;
    }
    
  }
  

}