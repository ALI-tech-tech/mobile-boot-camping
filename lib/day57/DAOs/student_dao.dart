import 'package:floor/floor.dart';
import 'package:flutter_practis/day57/entites/student.dart';

@dao
abstract class StudentDao {
  @Query('SELECT * FROM StudentX')
  Future<List<Student>> getAllStudents();
  // @Query('select * from studentx join department  on studentx.departmentId=department.id')
  // Future<List> getAllStudentswithDepart();
  @Query('SELECT * FROM StudentX WHERE id = :id')
  Future<Student?> getOneStudent(int id);
  @Query('SELECT * FROM StudentX WHERE departmentId = :id')
  Future<List<Student>> getAllStudentDepartment(int id);
@Query('SELECT studentx.* FROM StudentX join regcourse on studentx.id=regcourse.StudentId WHERE regcourse.CourseId= :id')
  Future<List<Student>> getAllStudentCourse(int id);
  @insert
  Future<int> AddStudent(Student s);
  @insert
  Future<List<int>> AddStudentList(List<Student> s);
  @update
  Future<int> updateStudent(Student s);
  @update
  Future<int> updateStudentList(List<Student> s);
 @Query("update studentx  set departmentId=null  where departmentId= :id")
  Future<int?> updateStudentListByDeptId(int id);
  @Query('DELETE FROM StudentX WHERE id = :id')
  Future<int?> deleteStudent(int id);
  @delete
  Future<int> deleteStudent2(Student s);
  @delete
  Future<int> deleteStudentList(List<Student> s);
  @Query('DELETE FROM StudentX')
  Future<int?> deletAllStudent();

  @Query('SELECT * FROM StudentX WHERE full_name LIKE :word')
  Future<List<Student>> searchByName(String word);
}