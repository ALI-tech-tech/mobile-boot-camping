
import 'package:floor/floor.dart';

@Entity(tableName: 'work_type')
class WorkType {
  @PrimaryKey()
  final int? id;

  final String name;

  WorkType({
     this.id,
    required this.name,
  });
}