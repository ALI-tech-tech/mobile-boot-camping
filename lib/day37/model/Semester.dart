import 'package:uuid/uuid.dart';

import 'Course.dart';

class Semester {
  String? id;
  String? season;
  int? year;
  bool isActive=false;
  List<Course> courses=[];
 List<Course> get getCourses => this.courses;

 set setCourses(Course course) => this.courses.add(course);


  Semester({required this.season,required this.year}):id=Uuid().v4();
}