import 'dart:io';

void main(List<String> args) {
  
  for (var i = 5; i >0; i--) {
    for (var j = i-1; j <5; j++) {
      stdout.write("*");
    }
    print("");
  }
}