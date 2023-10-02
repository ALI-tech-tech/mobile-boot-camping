import 'PersonBuilder.dart';

class Person {
  String? firstName;
  String? lastName;
  int? age;
  String? profession;
  List<String>hobbies=[];
  
  Person({required PersonBuilder pb}){
    this.firstName=pb.firstName;
    this.lastName=pb.lastName;
    this.age=pb.age;
    this.hobbies=pb.hobbies;
    this.profession=pb.profession;
  }

}