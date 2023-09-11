import 'dart:io';

void main(List<String> args) {
  int k=1;
  for (var i = 0; i <5; i++) {
    for (var j = 0; j <=i; j++) {
      stdout.write(k.toString()+" ");
      k+=1;
    }
    print("");
    
  }
}