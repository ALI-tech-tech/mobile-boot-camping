import 'package:floor/floor.dart';
import 'package:flutter_practis/day57/entites/course.dart';
import 'package:flutter_practis/day57/entites/reg_course.dart';

@dao
abstract class RegCourseDao {
  @Query('SELECT Course.id,Course.name FROM Course JOIN RegCourse ON Course.id = RegCourse.CourseId')
  Future<List<RegCourse>> getAllRegisteredCourses();

  @Query('SELECT Course.* FROM Course JOIN RegCourse ON Course.id = RegCourse.CourseId where RegCourse.StudentId=:studentId')
  Future<List<Course>> getRegisteredCoursesByStudentId(int studentId);

 
  @insert
  Future<void> insertRegisteredCourse(RegCourse regCourse);
@Query("delete from regcourse where regcourse.StudentId= :id")
  Future<void> deleteRegisteredCourseByStudentid(int id);
  @Query("delete from regcourse where regcourse.CourseId= :id")
  Future<void> deleteRegisteredCourseByCourseid(int id);
  @delete   
  Future<void> deleteRegisteredCourse(RegCourse regCourse);
}