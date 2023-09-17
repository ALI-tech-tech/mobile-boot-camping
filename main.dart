
import 'Course.dart';
import 'Student.dart';

void main(List<String> args) {
  Course co=Course()..name="Dart"..number=256..isAvailable=true;
  Course co1=Course()..name="Python"..number=300..isAvailable=false;
  Course co2=Course()..name="HTML"..number=500..isAvailable=true;
  Course co3=Course()..name="Dart"..number=256..isAvailable=true;
  Course co4=Course()..name="Dart"..number=256..isAvailable=true;
  Course co5=Course()..name="Dart"..number=256..isAvailable=true;

  Student std=Student()..Rollno=9564262..isActive=true..name="Ali";
  std.registercoures(co);
  std.registercoures(co2);
  std.registercoures(co3);
  std.registercoures(co4);
  std.registercoures(co5);
  std.print_registeredcourses();

}