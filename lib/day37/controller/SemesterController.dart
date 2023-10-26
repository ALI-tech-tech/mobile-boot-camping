import 'package:flutter_practis/day37/model/Semester.dart';

class SemesterController {
  List<Semester> listSemesters=[];

  addsemester(Semester semester){
    listSemesters.add(semester);
  }

  deletesemester(String semester) {
    listSemesters.removeWhere((semester) => semester.id == semester);
  }
}