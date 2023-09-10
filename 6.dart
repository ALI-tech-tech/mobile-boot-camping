
import 'myfunction.dart';

void main(List<String> args) {
  //input method from myfunction.dart
  String Radius=input("enter radius : ");
  if (isnumber(Radius)) {
    double Area=double.parse(Radius)*double.parse(Radius)*(22/7);
    print("Area : $Area");   
  }else{
    print("pleas enter number");
  }
 
}