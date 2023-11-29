
import 'package:floor/floor.dart';

import 'user.dart';

@Entity(tableName: 'skill')
class Skill {
  @PrimaryKey()
  final int id;
@ForeignKey(entity: User, childColumns: ['user_id'], parentColumns: ['id'])
  @ColumnInfo(name: 'user_id')
  final int userId;

  @ColumnInfo(name: 'skill_name')
  final String skillName;

  final int level;

  Skill({
    required this.id,
    required this.userId,
    required this.skillName,
    required this.level,
  });
}
