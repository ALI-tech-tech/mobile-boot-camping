import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_practis/day57/DAOs/course_dao.dart';
import 'package:flutter_practis/day57/DAOs/department_dao.dart';
import 'package:flutter_practis/day57/DAOs/reqcoures_dao.dart';
import 'package:flutter_practis/day57/DAOs/student_dao.dart';
import 'package:flutter_practis/day57/entites/course.dart';
import 'package:flutter_practis/day57/entites/department.dart';
import 'package:flutter_practis/day57/entites/reg_course.dart';
import 'package:flutter_practis/day57/entites/student.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [Student, Department, Course,RegCourse ])
abstract class AppDatabase extends FloorDatabase {
  StudentDao get studentDao;
  DepartmentDao get departmentDao;
  CourseDao get coursedao;
  RegCourseDao get regcoursedao;
}