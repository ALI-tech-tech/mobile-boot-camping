import 'package:floor/floor.dart';
import 'package:flutter_practis/day57/entites/department.dart';

@Entity(
  foreignKeys: [ForeignKey(childColumns: ["departmentId"], parentColumns: ["id"], entity: Department)]
)
class Course {
  @primaryKey
  final int? id;
  final String? name;
  final int? hours;
  // final int? departmentId;

  Course( {this.id, this.name, this.hours});
}