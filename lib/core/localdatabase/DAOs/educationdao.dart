import 'package:floor/floor.dart';


import '../entities/education.dart';

@dao
abstract class EducationDao {
  @Query('SELECT * FROM education')
  Future<List<Education>> getAllEducations();

  @Query('SELECT * FROM education WHERE id = :id')
  Future<Education?> getEducationById(int id);

  @insert
  Future<void> insertEducation(Education education);

  @update
  Future<void> updateEducation(Education education);

  @delete
  Future<void> deleteEducation(Education education);
}