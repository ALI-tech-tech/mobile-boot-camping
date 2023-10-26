import 'package:flutter_practis/day37/app_list.dart';
import 'package:flutter_practis/day37/model/gpa.dart';

class GpaController {
  List<GPA> gpaAll=[];

  getAllGpa(){
    gpaAll=List.generate(AppList.gpaConversion.length, (index) => GPA.fromjson(AppList.gpaConversion[index]));
  }
}