import 'package:floor/floor.dart';
@entity
class Department {
  @primaryKey
  final int? id;
  final String? name;

  Department({this.id, this.name});
}