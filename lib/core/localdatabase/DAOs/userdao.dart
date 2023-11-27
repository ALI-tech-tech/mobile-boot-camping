import 'package:floor/floor.dart';

import '../entities/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM user')
  Future<List<User>> getAllUsers();

  @Query('SELECT * FROM user WHERE id = :id')
  Future<User?> getUserById(int id);

  @insert
  Future<void> insertUser(User user);

  @update
  Future<void> updateUser(User user);

  @delete
  Future<void> deleteUser(User user);
}