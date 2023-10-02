import 'Course.dart';
import 'department.dart';

class Teacher {
  int?id;
  Department? department;
  String?name;
  int?salary;
  List<Course> courses=[];

  Teacher({required this.id, required this.name});
}