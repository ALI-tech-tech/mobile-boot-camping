
import 'package:floor/floor.dart';
import 'package:flutter_practis/day57/entites/department.dart';


// @entity
@Entity(tableName: 'StudentX', foreignKeys: [
  ForeignKey(
      childColumns: ['departmentId'],
      parentColumns: ['id'],
      entity: Department
  ),
], indices: [
  Index(value: ['phone_no','email'], unique: false)
])
class Student {
  @primaryKey
  final int? id;
  @ColumnInfo(name: 'full_name')
  final String? name;
  @ColumnInfo(name: 'phone_no')
  final String? phoneNo;
  final String? email;
  final bool? active;

  final int? departmentId;
  @ignore
  final bool isSelected;

  Student({this.id, this.name, this.phoneNo,
    this.departmentId, this.email,
    this.active, this.isSelected = false});
}