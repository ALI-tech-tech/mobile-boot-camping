import 'model/program.dart';
import 'controller/programdapter.dart';

void main(List<String> args) {
  Programadapter pd=Programadapter();
  List<Program> pro= pd.getdata();
  pro.forEach((element) {
    print("${element.id}, ${element.program_name}, ${element.fees}");
  });

}