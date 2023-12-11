import 'package:flutter/foundation.dart';
import 'package:taskmanager/core/model/member.dart';
import 'package:taskmanager/helper/DB/localDB.dart';

import '../../helper/DB/dbtable.dart';

class MemberViewModel with ChangeNotifier{
  List<Member> allMembers=[];
  LocalDB localdb=LocalDB();

MemberViewModel(){
  getMembers();
}
  getMembers()async{
   List<Map<String, dynamic>> all= await localdb.getAllData(DBTable.TBL_MEMBER_NAME);
   print(all);
   allMembers=all.map((e) => Member.fromJson(e)).toList();
   notifyListeners();
  }
  

}