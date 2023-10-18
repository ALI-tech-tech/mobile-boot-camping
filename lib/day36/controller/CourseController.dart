import 'package:flutter_practis/day36/model/Course.dart';

class CourseController {
  static List<Course> li = [];

   addCourse({required String name, required int hour}) {
    Course c = Course(Id: genId(), name: name, hours: hour);
    findByName(name: name) == false ||
            (findByName(name: name) as Course).name == null
        ? li.add(c)
        : false;
  }

  findByName({required String name}) {
    return li.isNotEmpty
        ? li.firstWhere((element) => element.name == name,
            orElse: () => Course.empty())
        : false;
  }

   findById({required int Id}) {
    return li.isNotEmpty
        ? li.firstWhere((element) => element.Id == Id,
            orElse: () => Course.empty())
        : false;
  }

   editCourse({required int id, required String name, required int h}) {
    for (var i = 0; i < li.length; i++) {
      if (li[i].Id == id) {
        li[i].name = name;
        li[i].hours = h;
        return true;
      }
    }

    return false;
  }

   removeCourse({required int id}) {
    var c = findById(Id: id);
    return c != false ? li.remove(c) : false;
  }

   genId() {
    int id = 0;
    return li.isEmpty ? id : (li.last).Id! + 1;
  }
}
