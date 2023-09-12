/*
3) Write a program to create a method that takes an integer as a parameter and throws 
an exception (Custom Exception) if the number is odd.
*/

import 'myfunction.dart';
//class implement from Exception interface & has a property String for message
class CustomException implements Exception {
  String cause;
  CustomException(this.cause);
}

void main() {
  //using try catch to handel custom Exception
  try {
    throwException(int.parse(input("Enter Even Number : ")));
  } on CustomException {
    print("Error : The number is odd ");
  }
}
//method except integer parameter & check if odd then call CustomException constructor
// & pass message as a parameter
throwException(int num) {
  if (num%2!=0) {
   throw new CustomException('This is my first custom exception'); 
  }
  else{
    print("Even");
  }
  
}