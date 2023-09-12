/*
2) Write function that accept the user age as a required named parameter. if the passed 
age under 0 just throw an exception and display message that says : “Age Can’t be 
Negative”
*/

import 'myfunction.dart';
void main(List<String> args) {
  //using try to display Exception
  try {
    age(age: int.parse(input("Enter your age : ")));
  } catch (e) {
   print(e); 
  }
  
}
//method define throw exception  
age({required int age}){
  if (age<0) {
    throw new Exception("Age Can’t be Negative");
  }
}

