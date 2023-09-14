
import '../mypackage/myfunction.dart';

List<Map<String,dynamic>> search(String txt,List<Map<String,dynamic>> li){
  List<Map<String,dynamic>> result=[];
  li.forEach((element) {
    if (element["name"].toString().contains(txt) || iffound(element["category"], txt) ) {
      result.add(element);
    }
    
  });
  return result;
}

