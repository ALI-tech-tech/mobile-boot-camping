/*
5) Write a program to implement an enum called "Shapes” with the following elements.
SQUARE, CIRCLE, RECTANGLE, TRIANGLE, HEXAGON.  Get the elements as list
 Access circle element directly
 Display the first element in enum
 Display index of triangle
 Get the first element with different way you use in point number 3
 Get the elements who have “AN” in their names
 Get the first element who have “T in their name”
 Get the elements that it’s length more than 6 and in starting from index 3 ( index 3 
included )
*/

void main(List<String> args) {
  //Access circle element directly
  String circle=Shapes.CIRCLE.name.toString();
  //Display the first element in enum
  print(Shapes.values.first.name);
  //Display index of triangle
  print(Shapes.TRIANGLE.index);
  //Get the first element with different way you use in point number 3
  String felem=Shapes.values.elementAt(0).name;
  //Get the elements who have “AN” in their names
  List<dynamic> name=Shapes.values.where((element) => element.name.contains("AN")).toList();
  //Get the first element who have “T in their name”
  String fname=Shapes.values.firstWhere((element) => element.name.contains("T")).toString().substring(7);
  //Get the elements that it’s length more than 6 and in starting from index 3 ( index 3 included )
  List<dynamic> name5=Shapes.values.getRange(3,Shapes.values.length).where((element) => element.name.length>6).toList();
 
}

enum Shapes { SQUARE, CIRCLE, RECTANGLE, TRIANGLE, HEXAGON }
