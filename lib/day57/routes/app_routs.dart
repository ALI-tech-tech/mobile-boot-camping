import 'package:flutter/material.dart';
import 'package:flutter_practis/day57/home.dart';
import 'package:flutter_practis/day57/view/course/displayCourse.dart';
import 'package:flutter_practis/day57/view/department/display_dep.dart';
import 'package:flutter_practis/day57/view/student/student.dart';

class AppRoutes {
    static const String studentScreen = '/student_screen';
    static const String homeScreen = '/home_screen';
    static const String deptScreen = '/dept_screen';
    static const String courseScreen = '/course_screen';
    

    


  static Map<String, WidgetBuilder> routes = {
    
    homeScreen:(context) => HomeScreen(),
    studentScreen:(context) => StudentScreen(),
    deptScreen:(context) => DepartmentScreen(),
    courseScreen:(context) => CourseScreen(),
    
  };
}
