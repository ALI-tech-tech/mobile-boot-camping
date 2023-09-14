
import 'controller/readdata.dart';
import 'controller/removebook.dart';
import 'mypackage/myfunction.dart';
import 'screen/addbook.dart';
import 'screen/cart.dart';
import 'screen/remvebook.dart';
import 'screen/screen1.dart';
import 'screen/search.dart';
import 'screen/viewbooks.dart';
import 'setting.dart';

void main(List<String> args) {
  String choiceuser="" ;
  List<Map<String,dynamic>> li=[];
  List<Map<String,dynamic>> cart=[];
  var list= readJsonFile(setapp.path);
  for (var i = 0; i < list.length; i++) {
    li.add(list[i]);
  }
  do {
    choiceuser=userview();
    switch (choiceuser) {
      case '1':
      printbooks(li);
        break;
      case '2':
      li.add(addbook(li));
      print(li);
      case '3':
      int id= gitbookid(li);
      removebook(li,id);
      break;
      case "4":
      var g= search(input("Enter Your Search Word (Name / Category) : "), li);
      printbooks(g);
      break;
      case '5':
      cart= addtocart(cart,li);

      break;
      default:
    }
    
  } while (choiceuser!='q'); 
}



