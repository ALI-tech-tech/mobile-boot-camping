import 'package:floor/floor.dart';
import 'package:flutter_practis/day57/entites/course.dart';

@dao
abstract class CourseDao {
  @Query('SELECT * FROM Course')
  Future<List<Course>> getAllCourses();
  @Query('SELECT course.* from course where id not in (select regcourse.CourseId from regcourse where regcourse.StudentId= :id)')
  Future<List<Course>> getAllCoursesWithoutRegster(int id);
  @Query('SELECT * FROM Course WHERE id = :id')
  Future<Course?> getCourseById(int id);

  @insert
  Future<int> insertCourse(Course course);

  @delete
  Future<int?> deleteCourse(Course course);

  @update
  Future<int?> updateCourse(Course course);
}