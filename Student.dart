


import 'mypackage/myfunction.dart';

void main(List<String> args) {
  int count=int.parse(input("Enter how many you student : "));
  List<Student> liststudent=[];
  for (var i = 0; i < count; i++) {
    String name=input("Enter  name :");
    int age=int.parse(input("Enter  age : "));
    String major=input("Enter  major : ");
    Student st=Student(name, age, major);
    liststudent.add(st);
  }
  String majorfilter=input("Enter major to filter student : ");
  liststudent.forEach((element) {
    if (element.major.contains(majorfilter)) {
      element.studentinfo();
      //print("Student name :${element.name} , Student age : ${element.age},Student major : ${element.major}");
    }
  });

  String name=input("Enter  name :");
    int age=int.parse(input("Enter  age : "));
    String major=input("Enter  major : ");
    Student st=Student(name, age, major);
  st.studentinfo();
}

class Student{
  late String name;
  late int age;
  late String major;

  Student(String name,int age,String major){
    this.name=name;
    this.age=age;
    this.major=major;
  }
  studentinfo(){
    print("Student name :$name , Student age : $age ,Student major : $major");
  }
}