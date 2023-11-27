
import 'package:floor/floor.dart';

@Entity(tableName: 'user_type')
class UserType {
  @PrimaryKey()
  final int id;

  final String name;

  UserType({
    required this.id,
    required this.name,
  });
}
