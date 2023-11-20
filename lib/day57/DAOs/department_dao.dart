import 'package:floor/floor.dart';
import 'package:flutter_practis/day57/entites/department.dart';


@dao
abstract class DepartmentDao {
  @Query('SELECT * FROM Department')
  Future<List<Department>> getAllDepartments();
  @Query('SELECT * FROM Department WHERE id = :id')
  Future<Department?> getOneDepartment(int id);

  @insert
  Future<int> AddDepartment(Department s);
  @insert
  Future<List<int>> AddDepartmentList(List<Department> s);
  @update
  Future<int> updateDepartment(Department s);
  @update
  Future<int> updateDepartmentList(List<Department> s);

  @Query('DELETE FROM Department WHERE id = :id')
  Future<int?> deleteDepartment(int id);
  @delete
  Future<int> deleteDepartment2(Department s);
  @delete
  Future<int> deleteDepartmentList(List<Department> s);
  @Query('DELETE FROM Department')
  Future<int?> deletAllDepartment();

  @Query('SELECT * FROM Department WHERE name LIKE :word')
  Future<List<Department>> searchByName(String word);
}