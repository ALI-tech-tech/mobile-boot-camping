import 'package:floor/floor.dart';

import '../entities/user_type.dart';

@dao
abstract class UserTypeDao {
  @Query('SELECT * FROM user_type')
  Future<List<UserType>> getAllUserTypes();

  @Query('SELECT * FROM user_type WHERE id = :id')
  Future<UserType?> getUserTypeById(int id);

  @insert
  Future<void> insertUserType(UserType userType);

  @update
  Future<void> updateUserType(UserType userType);

  @delete
  Future<void> deleteUserType(UserType userType);
}