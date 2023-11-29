import 'package:floor/floor.dart';

import '../entities/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM user')
  Future<List<User>> getAllUsers();

  @Query('SELECT * FROM user WHERE id = :id')
  Future<User?> getUserById(int id);

  @insert
  Future<int?> insertUser(User user);

  @update
  Future<int?> updateUser(User user);

  @delete
  Future<int?> deleteUser(User user);
}