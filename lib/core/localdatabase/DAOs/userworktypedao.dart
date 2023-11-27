import 'package:floor/floor.dart';

import '../entities/user_work_type.dart';

@dao
abstract class UserWorkTypeDao {
  @Query('SELECT * FROM user_work_type')
  Future<List<UserWorkType>> getAllUserWorkTypes();

  @Query('SELECT * FROM user_work_type WHERE user_id = :userId')
  Future<List<UserWorkType>> getUserWorkTypesByUserId(int userId);

  @Query('SELECT * FROM user_work_type WHERE work_type_id = :workTypeId')
  Future<List<UserWorkType>> getUserWorkTypesByWorkTypeId(int workTypeId);

  @Query('SELECT * FROM user_work_type WHERE user_id = :userId AND work_type_id = :workTypeId')
  Future<UserWorkType?> getUserWorkTypeByUserIdAndWorkTypeId(int userId, int workTypeId);

  @insert
  Future<void> insertUserWorkType(UserWorkType userWorkType);

  @delete
  Future<void> deleteUserWorkType(UserWorkType userWorkType);
}