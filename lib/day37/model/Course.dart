import 'package:uuid/uuid.dart';

class Course {
  String? id;
  String? name;
  int?cridts;

  Course({required this.name,required this.cridts}):id=Uuid().v4();
}