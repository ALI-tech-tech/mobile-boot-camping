import 'package:floor/floor.dart';

import '../entities/work_type.dart';

@dao
abstract class WorkTypeDao {
  @Query('SELECT * FROM work_type')
  Future<List<WorkType>> getAllWorkTypes();

  @Query('SELECT * FROM work_type WHERE id = :id')
  Future<WorkType?> getWorkTypeById(int id);

  @insert
  Future<void> insertWorkType(WorkType workType);

  @update
  Future<void> updateWorkType(WorkType workType);

  @delete
  Future<void> deleteWorkType(WorkType workType);
}