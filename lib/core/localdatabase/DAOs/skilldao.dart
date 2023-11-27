import 'package:floor/floor.dart';

import '../entities/skill.dart';

@dao
abstract class SkillDao {
  @Query('SELECT * FROM skill')
  Future<List<Skill>> getAllSkills();

  @Query('SELECT * FROM skill WHERE id = :id')
  Future<Skill?> getSkillById(int id);

  @insert
  Future<void> insertSkill(Skill skill);

  @update
  Future<void> updateSkill(Skill skill);

  @delete
  Future<void> deleteSkill(Skill skill);
}