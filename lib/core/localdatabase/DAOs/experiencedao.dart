import 'package:floor/floor.dart';


import '../entities/experians.dart';

@dao
abstract class ExperienceDao {
  @Query('SELECT * FROM experience')
  Future<List<Experience>> getAllExperiences();

  @Query('SELECT * FROM experience WHERE id = :id')
  Future<Experience?> getExperienceById(int id);

  @insert
  Future<void> insertExperience(Experience experience);

  @update
  Future<void> updateExperience(Experience experience);

  @delete
  Future<void> deleteExperience(Experience experience);
}