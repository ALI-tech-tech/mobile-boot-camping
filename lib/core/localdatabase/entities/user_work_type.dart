
import 'package:floor/floor.dart';
import 'package:jobsfinder/core/localdatabase/entities/user.dart';
import 'package:jobsfinder/core/localdatabase/entities/work_type.dart';

@Entity(tableName: 'user_work_type',  primaryKeys: ['user_id', 'work_type_id'],
  foreignKeys: [
    ForeignKey(childColumns: ['user_id'], parentColumns: ['id'], entity: User),
    ForeignKey(childColumns: ['work_type_id'], parentColumns: ['id'], entity: WorkType),
  ])
class UserWorkType {
  @ColumnInfo(name: 'user_id')
  final int userId;

  @ColumnInfo(name: 'work_type_id')
  final int workTypeId;

  UserWorkType({
    required this.userId,
    required this.workTypeId,
  });
}
