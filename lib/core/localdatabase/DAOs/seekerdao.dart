import 'package:floor/floor.dart';

import '../entities/seeker.dart';


@dao
abstract class SeekerDao {
  @Query('SELECT * FROM seeker')
  Future<List<Seeker>> getAllSeekers();

  @Query('SELECT * FROM seeker WHERE id = :id')
  Future<Seeker?> getSeekerById(int id);

  @insert
  Future<int?> insertSeeker(Seeker seeker);

  @update
  Future<void> updateSeeker(Seeker seeker);

  @delete
  Future<void> deleteSeeker(Seeker seeker);
}