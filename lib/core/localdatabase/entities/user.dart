import 'package:floor/floor.dart';

@Entity(tableName: 'user')
class User {
  @PrimaryKey()
  final int? id;

  @ColumnInfo(name: 'first_name')
  final String firstName;

  @ColumnInfo(name: 'last_name')
  final String lastName;

  @ColumnInfo(name: 'user_name')
  final String userName;

  final String password;
  final String email;

  @ColumnInfo(name: 'is_active')
  final bool isActive;

  @ColumnInfo(name: 'user_type_id')
   int userTypeId;
  get getUserTypeId => this.userTypeId;

 set setUserTypeId( userTypeId) => this.userTypeId = userTypeId;

  User( {
     this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userName,
    required this.password,
    required this.isActive,
    required this.userTypeId,
  });
}
