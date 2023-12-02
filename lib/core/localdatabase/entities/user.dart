import 'package:floor/floor.dart';
import 'package:jobsfinder/core/localdatabase/entities/user_type.dart';

@Entity(tableName: 'user')
class User {
  @PrimaryKey()
   int? id;

  @ColumnInfo(name: 'first_name')
   String? firstName;

  @ColumnInfo(name: 'last_name')
   String? lastName;

  @ColumnInfo(name: 'user_name')
   String? userName;

   String? password;
   String? email;

  @ColumnInfo(name: 'is_active')
   bool? isActive;

  @ForeignKey(entity: UserType, childColumns: ['user_type_id'], parentColumns: ['id'])

  @ColumnInfo(name: 'user_type_id')
   int? userTypeId;
  get getUserTypeId => userTypeId;

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
  User.empty();
}
